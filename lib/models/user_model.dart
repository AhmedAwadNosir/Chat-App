class UserModel {
  String? userName;
  String? email;
  String? avatar;

  UserModel({
    this.userName,
    this.email,
    this.avatar,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
        userName: json["userName"],
        email: json["email"],
        avatar: json["avatar"]);
  }
  Map<String, dynamic> tojson() {
    return {
      "userName":userName,
      'email':email,
      'avatar':avatar,
    };
  }
}
