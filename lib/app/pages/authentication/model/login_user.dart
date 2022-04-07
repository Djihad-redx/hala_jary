
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.email,
    this.fullname,
    this.password,
    this.phone,
    this.nationality,
    this.address,
    this.lat,
    this.long,
    this.profession,
    this.birthdate,
    this.bio,
    this.image,
    this.gender,
    this.interest,
    this.lastLogin,
    this.resetToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
  });

  int? id;
  String? email;
  String? fullname;
  String? password;
  String? phone;
  String? nationality;
  String? address;
  double? lat;
  double? long;
  String? profession;
  String? birthdate;
  String? bio;
  String? image;
  String? gender;
  String? interest;
  dynamic lastLogin;
  String? resetToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    fullname: json["fullname"],
    password: json["password"],
    phone: json["phone"],
    nationality: json["nationality"],
    address: json["address"],
    lat: json["lat"],
    long: json["long"],
    profession: json["profession"],
    birthdate: json["birthdate"],
    bio: json["bio"],
    image: json["image"],
    gender: json["gender"],
    interest: json["interest"],
    lastLogin: json["last_login"],
    resetToken: json["reset_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "fullname": fullname,
    "password": password,
    "phone": phone,
    "nationality": nationality,
    "address": address,
    "lat": lat,
    "long": long,
    "profession": profession,
    "birthdate": birthdate,
    "bio": bio,
    "image": image,
    "gender": gender,
    "interest": interest,
    "last_login": lastLogin,
    "reset_token": resetToken,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
    "token": token,
  };
}
