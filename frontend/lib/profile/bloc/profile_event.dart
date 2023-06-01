abstract class ProfileEvent {}

class ProfileLoadEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final String fullname;
  final String bio;
  final String email;
  final String phonenumber;

  ProfileUpdateEvent({
    required this.fullname,
    required this.bio,
    required this.email,
    required this.phonenumber,
  });
}
