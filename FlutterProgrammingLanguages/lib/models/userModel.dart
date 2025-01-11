import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  int? id;
  String? number;
  String? firstName;
  String? lastName;
  dynamic image;
  String? location;
  int? otp;
  String? role;

  User({
    this.id,
    this.number,
    this.firstName,
    this.lastName,
    this.image,
    this.location,
    this.otp,
    this.role,
  });

  User copyWith({
    int? id,
    String? number,
    String? firstName,
    String? lastName,
    dynamic image,
    String? location,
    int? otp,
    String? role,
  }) =>
      User(
        id: id ?? this.id,
        number: number ?? this.number,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        image: image ?? this.image,
        location: location ?? this.location,
        otp: otp ?? this.otp,
        role: role ?? this.role,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        number: json["number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        location: json["location"],
        otp: json["otp"],
      );

  factory User.fromMapPhoneNumber(Map<String, dynamic> json) => User(
        number: json["number"],
        otp: json["otp"],
      );

  factory User.fromMapOtp(Map<String, dynamic> json) => User(
        number: json["number"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "location": location,
        "otp": otp,
      };

  Map<String, dynamic> toMapPhonenumber() => {
        "number": number,
      };

  Map<String, dynamic> toMapOtp() => {
        "number": number,
        "otp": otp,
      };
}
