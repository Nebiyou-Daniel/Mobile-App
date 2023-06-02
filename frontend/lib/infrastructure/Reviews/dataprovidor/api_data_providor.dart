import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../application/Reviews/review.dart';

class ApiDataProvidor {
  final String _baseUrl = 'http://localhost:8080/api/reviews';
  final http.Client httpClient = http.Client();

  getTraineeReview(
      {required int trainerId, required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://localhost:3050/review/trainee/$trainerId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
        // body: jsonEncode(<String, dynamic>{
        //   'comment': review.comment,
        //   'rating': review.rating,
        //   'trainerId': review.trainerId
        // }),
      ).timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an errorE
      if (response.body == "") {
        return null;
      } 
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Review review = Review.fromJson(jsonDecode(response.body));
        return review;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to get review: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to get review: $e');
    }
  }

  // post a review
  postReview({required Review review, required String accessToken}) async {
    try {
      final http.Response response = await http
          .post(
            Uri.parse('http://localhost:3050/review'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $accessToken',
            },
            body: jsonEncode(<String, dynamic>{
              'comment': review.comment,
              'rating': review.rating,
              'trainerId': review.trainerId
            }),
          )
          .timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.body == "") {
        return null;
      }
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Review review = Review.fromJson(jsonDecode(response.body));
        return review;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to post review: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to post review: $e');
    }
  }

  // delete a review
  deleteReview({required int reviewId, required String accessToken}) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse('http://localhost:3050/review/$reviewId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
        // body: jsonEncode(<String, dynamic>{
        //   'comment': review.comment,
        //   'rating': review.rating,
        //   'trainerId': review.trainerId
        // }),
      ).timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode == 200) {
        return "Review deleted successfully.";
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to delete review: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to delete review: $e');
    }
  }

  // update a review
  updateReview({required Review review, required String accessToken}) async {
    try {
      final http.Response response = await http
          .patch(
            Uri.parse('http://localhost:3050/review/${review.id}'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $accessToken',
            },
            body: jsonEncode(<String, dynamic>{
              'comment': review.comment,
              'rating': review.rating,
            }),
          )
          .timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Review review = Review.fromJson(jsonDecode(response.body));
        return review;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to edit review: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to edit review: $e');
    }
  }

  // get all reviews for a trainer by id
  getAllReviewsForTrainer({required String accessToken}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('http://localhost:3050/review'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
        // body: jsonEncode(<String, dynamic>{
        //   'comment': review.comment,
        //   'rating': review.rating,
        //   'trainerId': review.trainerId
        // }),
      ).timeout(const Duration(seconds: 2));

      // if successfull return something, else throw an error
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonList = jsonDecode(response.body) as List<dynamic>;
        List<Review> reviews =
            jsonList.map((jsonObject) => Review.fromJson(jsonObject)).toList();
        return reviews;
      } else {
        String errorMessage = jsonDecode(response.body)['message'][0];
        throw Exception('Failed to fetch reviews: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to fetch review: $e');
    }
  }
}
