class User {
  final String name;
  final int friends;
  final String urlImage;
  final DateTime birthday;

  User(
      {required this.name,
      required this.friends,
      required this.urlImage,
      required this.birthday});
  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      friends: json['friends'],
      urlImage: json['urlImage'],
      birthday: DateTime.parse(json['birthday']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'friends': friends,
      'urlImage': urlImage,
      'birthday': birthday.toIso8601String(),
    };
  }
}
