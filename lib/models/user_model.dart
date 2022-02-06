class UserModel {
  String? uid;
  String? email;
  String? username;
  int? point;
  String? photo;

  UserModel({this.uid, this.email, this.username, this.point, this.photo});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        point: map['point'],
        photo: map['photo']);
  }

  //send data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'point': point,
      'photo': photo,
    };
  }
}
