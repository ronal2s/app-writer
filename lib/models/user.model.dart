import 'dart:convert';

class UserModel {
  String user;
  String password;
  UserModel({
    this.user,
    this.password,
  });

  UserModel copyWith({
    String user,
    String password,
  }) {
    return UserModel(
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      user: map['user'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(user: $user, password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserModel &&
      o.user == user &&
      o.password == password;
  }

  @override
  int get hashCode => user.hashCode ^ password.hashCode;
}
