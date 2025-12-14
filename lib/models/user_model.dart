class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String phone;
  final String birthDate;
  final String image;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.phone,
    required this.birthDate,
    required this.image,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json, String accessToken) {
    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      maidenName: json['maidenName'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      birthDate: json['birthDate'] ?? '',
      image: json['image'] ?? 'https://i.imgur.com/g8Vd6Uj.png',
      token: accessToken,
    );
  }

  String get fullName => '$firstName $lastName';
}
