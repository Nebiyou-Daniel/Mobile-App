class Task {
  int id = 0;
  final String title;
  final String description;
  final DateTime date;
  final int traineeId;
  // final int trainerId;
  bool isCompleted = false;
  Task(
    this.id, {
    required this.title,
    required this.description,
    required this.date,
    required this.traineeId,
    this.isCompleted = false,
  });

  // implement a fromJson for task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      traineeId: json['traineeId'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'traineeId': traineeId,
      'isCompleted': isCompleted,
    };
  }

  // implement a copywith for task
  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    int? userId,
    bool? isCompleted,
  }) {
    return Task(
      id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      traineeId: traineeId,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
