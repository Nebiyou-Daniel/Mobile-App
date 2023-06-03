class Weight {
  int? id;
  final String weight;
  int? traineeId;
  String? height;

  Weight(this.id,
      {required this.weight, this.traineeId, this.height});

  // implement a fromJson for task
  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(json['id'],
        weight: json['weight'],
        traineeId: json['traineeId'],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weight': weight,
      'traineeId': traineeId,
    };
  }

  // implement a copywith for task
  Weight copyWith({
    int? id,
    required String weight,
    int? traineeId,
    int? trainerId,
  }) {
    return Weight(
      id ?? this.id,
      weight: this.weight,
      traineeId: traineeId ?? this.traineeId,
    );
  }
}
