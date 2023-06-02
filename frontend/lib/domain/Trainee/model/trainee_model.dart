// id: true,
// fullName: true,
// email: true,
// bio: true,
// phoneNumber: true

class Trainee {
  // Trainee model class
  // this class is used for trainee list and detail

  int id;
  String fullName;
  String email;
  String? bio;
  String? phone;
  String? address;

  Trainee({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
  });

  // factory method to create Trainee instance from json data
  factory Trainee.fromJson(Map<String, dynamic> json) {
    return Trainee(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  // method to convert Trainee instance to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
