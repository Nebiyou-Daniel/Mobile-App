

class Trainee {

  // Trainee model class
  // this class is used for trainee list and detail

  int id;
  String name;
  String email;
  String phone;
  String address;
  String photo;

  Trainee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.photo,
  });

  // factory method to create Trainee instance from json data
  factory Trainee.fromJson(Map<String, dynamic> json) {
    return Trainee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      photo: json['photo'],
    );
  }

  // method to convert Trainee instance to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'photo': photo,
    };
  }
}