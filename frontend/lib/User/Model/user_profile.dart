class User {
  int id;
  String role;
  String name;
  String username;
  String email;
  String phoneNumber;
  String password;
  String? token;

  User({
    required this.id,
    required this.role,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        role = json['role'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        password = json['password'],
        token = json['token'];

}
