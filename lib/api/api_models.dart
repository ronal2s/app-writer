import 'dart:convert';

class RequestLogin {
  String correo;
  String password;

  RequestLogin({
    this.correo,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'correo': correo,
      'password': password,
    };
  }

  factory RequestLogin.fromMap(Map<String, dynamic> map) {
    return RequestLogin(
      correo: map['correo'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestLogin.fromJson(String source) =>
      RequestLogin.fromMap(json.decode(source));
}

class ResponseLogin {
  String fullname;
  bool error;
  String nameError;
  int idUsuario;
  ResponseLogin({
    this.fullname,
    this.error,
    this.nameError,
    this.idUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'error': error,
      'nameError': nameError,
      'idUsuario': idUsuario,
    };
  }

  factory ResponseLogin.fromMap(Map<String, dynamic> map) {
    return ResponseLogin(
      fullname: map['fullname'],
      error: map['error'],
      nameError: map['nameError'],
      idUsuario: map['idUsuario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseLogin.fromJson(String source) =>
      ResponseLogin.fromMap(json.decode(source));

  ResponseLogin copyWith({
    String fullname,
    bool error,
    String nameError,
    int idUsuario,
  }) {
    return ResponseLogin(
      fullname: fullname ?? this.fullname,
      error: error ?? this.error,
      nameError: nameError ?? this.nameError,
      idUsuario: idUsuario ?? this.idUsuario,
    );
  }

  @override
  String toString() {
    return 'ResponseLogin(fullname: $fullname, error: $error, nameError: $nameError, idUsuario: $idUsuario)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseLogin &&
        other.fullname == fullname &&
        other.error == error &&
        other.nameError == nameError &&
        other.idUsuario == idUsuario;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^
        error.hashCode ^
        nameError.hashCode ^
        idUsuario.hashCode;
  }
}

class ResponseJournals {
  String cuerpo;
  String fecha;
  // ignore: non_constant_identifier_names
  int id_entrada;
  ResponseJournals({
    this.cuerpo,
    this.fecha,
    // ignore: non_constant_identifier_names
    this.id_entrada,
  });

  Map<String, dynamic> toMap() {
    return {
      'cuerpo': cuerpo,
      'fecha': fecha,
      'id_entrada': id_entrada,
    };
  }

  factory ResponseJournals.fromMap(Map<String, dynamic> map) {
    return ResponseJournals(
      cuerpo: map['cuerpo'],
      fecha: map['fecha'],
      id_entrada: map['id_entrada'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseJournals.fromJson(String source) =>
      ResponseJournals.fromMap(json.decode(source));
}
