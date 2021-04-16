import 'dart:convert';

class UserModel {
  String nombre;
  String apellido;
  String fechaNacimiento = '';
  String correo;
  String password;
  String confPassword;

  UserModel({
    this.nombre,
    this.apellido,
    this.fechaNacimiento,
    this.correo,
    this.password,
    this.confPassword,
  });

  UserModel copyWith({
    String nombre,
    String apellido,
    String fechaNacimiento,
    String correo,
    String password,
    String confPassword,
  }) {
    return UserModel(
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      correo: correo ?? this.correo,
      password: password ?? this.password,
      confPassword: confPassword ?? this.confPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'fechaNacimiento': fechaNacimiento,
      'correo': correo,
      'password': password,
      'confPassword': confPassword,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nombre: map['nombre'],
      apellido: map['apellido'],
      fechaNacimiento: map['fechaNacimiento'],
      correo: map['correo'],
      password: map['password'],
      confPassword: map['confPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(nombre: $nombre, apellido: $apellido, fechaNacimiento: $fechaNacimiento, correo: $correo, password: $password, confPassword: $confPassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.nombre == nombre &&
        other.apellido == apellido &&
        other.fechaNacimiento == fechaNacimiento &&
        other.correo == correo &&
        other.password == password &&
        other.confPassword == confPassword;
  }

  @override
  int get hashCode {
    return nombre.hashCode ^
        apellido.hashCode ^
        fechaNacimiento.hashCode ^
        correo.hashCode ^
        password.hashCode ^
        confPassword.hashCode;
  }
}
