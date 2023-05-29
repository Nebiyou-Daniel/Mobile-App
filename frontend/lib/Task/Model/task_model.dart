class Task {
  int id = 0;
  final String title;
  final String description;
  final DateTime date;
  final int userId;
  bool isCompleted = false;
  Task(
    this.id, {
    required this.title,
    required this.description,
    required this.date,
    required this.userId,
    required this.isCompleted,
  });

  // implement a fromJson for task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      // q: what kind of date string format is this expectinf 
      // a: it is expecting a string in the format of "YYYY-MM-DD"
      // q: give me an example
      // a: "2021-09-01"
      userId: json['userId'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'userId': userId,
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
      userId: userId ?? this.userId,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

}