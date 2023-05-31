// the following ApiDataProvidor class is used to get the data from the backend about review
// It has to do the following things:
// 1. get all reviews
// 2. post a review
// 3. delete a review
// 4. update a review
// 5. get all reviews for a trainer by id

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../review.dart';

class ApiDataProvidor {
  final String _baseUrl = 'http://localhost:8080/api/reviews';
  final http.Client httpClient = http.Client();

  // get all reviews
  Future<List<Review>> getAllReviews() async {
    final response = await httpClient.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final reviews = jsonDecode(response.body) as List;
      return reviews.map((review) => Review.fromJson(review)).toList();
    } else {
      throw Exception('Error getting reviews');
    }
  }

  // post a review
  Future<Review> postReview({required Review review}) async {
    final response = await httpClient.post(
          Uri.parse(_baseUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(review.toJson()),
        );
    if (response.statusCode == 200) {
      final review = jsonDecode(response.body);
      return Review.fromJson(review);
    } else {
      throw Exception('Error posting review');
    }
  }

  // delete a review
  Future<void> deleteReview({required int reviewId}) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/$reviewId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error deleting review');
    }
  }

  // update a review
  Future<void> updateReview({required Review review}) async {
    final http.Response response = await httpClient.put(
      Uri.parse('$_baseUrl/${review.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(review.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error updating review');
    }
  }

  // get all reviews for a trainer by id
  Future<List<Review>> getAllReviewsForTrainer({required int trainerId}) async {
    final response =
        await httpClient.get(Uri.parse('$_baseUrl/$trainerId'));
    if (response.statusCode == 200) {
      final reviews = jsonDecode(response.body) as List;
      return reviews.map((review) => Review.fromJson(review)).toList();
    } else {
      throw Exception('Error getting reviews');
    }
  }
}
