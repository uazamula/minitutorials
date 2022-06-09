class User {
  final String username;
  final String email;
  final String urlAvatar;

  User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });
  static User fromJson(Map<String,dynamic> json)=> User(
    username: json['username'],
    email: json['email'],
    urlAvatar: json['urlAvatar'],
  );
}
