
class UserData {
  final List<User> users;
  final int totalPages;

  UserData(this.users, this.totalPages);
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatarUrl: json['avatar'],
    );
  }
}
