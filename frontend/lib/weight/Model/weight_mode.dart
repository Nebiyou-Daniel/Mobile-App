class Weight {
  int? id;
  final String weight;
  int? traineeId;
  int? trainerId;
  String? height;

  Weight(this.id,
      {required this.weight, this.traineeId, this.trainerId, this.height});

  // implement a fromJson for task
  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(json['id'],
        weight: json['weight'],
        traineeId: json['traineeId'],
        trainerId: json['trainerId'],
        height: json['height']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weight': weight,
      'traineeId': traineeId,
      'trainerId': trainerId,
      'height': height,
    };
  }

  // implement a copywith for task
  Weight copyWith({
    int? id,
    required String weight,
    int? traineeId,
    int? trainerId,
    String? height,
  }) {
    return Weight(
      id ?? this.id,
      weight: this.weight,
      traineeId: traineeId ?? this.traineeId,
      trainerId: trainerId ?? this.trainerId,
      height: height,
    );
  }
}
