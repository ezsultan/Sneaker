class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? profileUrl;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profileUrl,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        profileUrl: json["profile_photo_url"],
        token: json["token"],
      );
}
