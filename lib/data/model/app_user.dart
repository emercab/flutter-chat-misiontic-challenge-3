import 'package:firebase_database/firebase_database.dart';

class AppUser {
  String? key;
  String email;
  String uid;
  String urlImage;

  AppUser(this.key, this.email, this.uid, this.urlImage);

  AppUser.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        email = json['email'] ?? "email",
        uid = json['uid'] ?? "uid",
        urlImage = json['urlImage'] ?? "urlImage";

  toJson() {
    return {
      "email": email,
      "uid": uid,
      "urlImage": urlImage,
    };
  }
}
