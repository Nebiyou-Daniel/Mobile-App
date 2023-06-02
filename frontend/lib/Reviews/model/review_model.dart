class Review {
  final int? id;
  final int rating;
  final String comment;
  final int traineeId;
  final int trainerId;

  Review({
    this.id,
    required this.rating,
    required this.comment,
    required this.traineeId,
    required this.trainerId,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      traineeId: json['traineeId'],
      trainerId: json['trainerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'comment': comment,
      'traineeId': traineeId,
      'trainerId': trainerId,
    };
  }

  // copyWith
  Review copyWith({
    int? id,
    int? rating,
    String? comment,
    int? traineeId,
    int? trainerId,
  }) {
    return Review(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      traineeId: traineeId ?? this.traineeId,
      trainerId: trainerId ?? this.trainerId,
    );
  }
}
