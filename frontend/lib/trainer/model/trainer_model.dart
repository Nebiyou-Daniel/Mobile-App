class Trainer {
  // id
  final int id;
  final String fullName;
  String? bio;
  final double averageRating;
  int? numberOfTrainees;
  final String email;
  String? phoneNumber;

  Trainer({
    required this.id,
    required this.fullName,
    required this.bio,
    required this.averageRating,
    required this.numberOfTrainees,
    required this.email,
    required this.phoneNumber, required int id,
  });

  // from json
  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['id'],
      fullName: json['fullName'],
      bio: json['bio'],
      averageRating: json['averageRating'],
      numberOfTrainees: json['numberOfTrainees'],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
    );
  }
}
