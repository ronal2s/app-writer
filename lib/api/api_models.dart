import 'dart:convert';

import 'package:flutter/foundation.dart';

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
  String correo;
  String fechaNacimiento;
  bool error;
  String nameError;
  int idUsuario;
  ResponseLogin({
    this.fullname,
    this.correo,
    this.fechaNacimiento,
    this.error,
    this.nameError,
    this.idUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'correo': correo,
      'fechaNacimiento': fechaNacimiento,
      'error': error,
      'nameError': nameError,
      'idUsuario': idUsuario,
    };
  }

  factory ResponseLogin.fromMap(Map<String, dynamic> map) {
    return ResponseLogin(
      fullname: map['fullname'],
      correo: map['correo'],
      fechaNacimiento: map['fechaNacimiento'],
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
    String correo,
    String fechaNacimiento,
    bool error,
    String nameError,
    int idUsuario,
  }) {
    return ResponseLogin(
      fullname: fullname ?? this.fullname,
      correo: correo ?? this.correo,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      error: error ?? this.error,
      nameError: nameError ?? this.nameError,
      idUsuario: idUsuario ?? this.idUsuario,
    );
  }

  @override
  String toString() {
    return 'ResponseLogin(fullname: $fullname, correo: $correo, fechaNacimiento: $fechaNacimiento, error: $error, nameError: $nameError, idUsuario: $idUsuario)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ResponseLogin &&
      other.fullname == fullname &&
      other.correo == correo &&
      other.fechaNacimiento == fechaNacimiento &&
      other.error == error &&
      other.nameError == nameError &&
      other.idUsuario == idUsuario;
  }

  @override
  int get hashCode {
    return fullname.hashCode ^
      correo.hashCode ^
      fechaNacimiento.hashCode ^
      error.hashCode ^
      nameError.hashCode ^
      idUsuario.hashCode;
  }
}

class ResponseJournals {
  String cuerpo;
  bool error;
  String fecha;
  int idEntrada;
  String sentimiento;
  String titulo;
  ResponseJournals({
    // ignore: non_constant_identifier_names
    this.cuerpo,
    this.error,
    this.fecha,
    this.idEntrada,
    this.sentimiento,
    this.titulo,
  });

  Map<String, dynamic> toMap() {
    return {
      'cuerpo': cuerpo,
      'error': error,
      'fecha': fecha,
      'idEntrada': idEntrada,
      'sentimiento': sentimiento,
      'titulo': titulo,
    };
  }

  factory ResponseJournals.fromMap(Map<String, dynamic> map) {
    return ResponseJournals(
      cuerpo: map['cuerpo'],
      error: map['error'],
      fecha: map['fecha'],
      idEntrada: map['idEntrada'],
      sentimiento: map['sentimiento'],
      titulo: map['titulo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseJournals.fromJson(String source) =>
      ResponseJournals.fromMap(json.decode(source));

  ResponseJournals copyWith({
    String cuerpo,
    bool error,
    String fecha,
    int idEntrada,
    String sentimiento,
    String titulo,
  }) {
    return ResponseJournals(
      cuerpo: cuerpo ?? this.cuerpo,
      error: error ?? this.error,
      fecha: fecha ?? this.fecha,
      idEntrada: idEntrada ?? this.idEntrada,
      sentimiento: sentimiento ?? this.sentimiento,
      titulo: titulo ?? this.titulo,
    );
  }

  @override
  String toString() {
    return 'ResponseJournals(cuerpo: $cuerpo, error: $error, fecha: $fecha, idEntrada: $idEntrada, sentimiento: $sentimiento, titulo: $titulo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseJournals &&
        other.cuerpo == cuerpo &&
        other.error == error &&
        other.fecha == fecha &&
        other.idEntrada == idEntrada &&
        other.sentimiento == sentimiento &&
        other.titulo == titulo;
  }

  @override
  int get hashCode {
    return cuerpo.hashCode ^
        error.hashCode ^
        fecha.hashCode ^
        idEntrada.hashCode ^
        sentimiento.hashCode ^
        titulo.hashCode;
  }
}

class RequestJournal {
  String texto;
  String titulo;
  String sentimiento;
  RequestJournal({
    this.texto,
    this.titulo,
    this.sentimiento,
  });

  RequestJournal copyWith({
    String texto,
    String titulo,
    String sentimiento,
  }) {
    return RequestJournal(
      texto: texto ?? this.texto,
      titulo: titulo ?? this.titulo,
      sentimiento: sentimiento ?? this.sentimiento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'texto': texto,
      'titulo': titulo,
      'sentimiento': sentimiento,
    };
  }

  factory RequestJournal.fromMap(Map<String, dynamic> map) {
    return RequestJournal(
      texto: map['texto'],
      titulo: map['titulo'],
      sentimiento: map['sentimiento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestJournal.fromJson(String source) =>
      RequestJournal.fromMap(json.decode(source));

  @override
  String toString() =>
      'RequestJournal(texto: $texto, titulo: $titulo, sentimiento: $sentimiento)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RequestJournal &&
        other.texto == texto &&
        other.titulo == titulo &&
        other.sentimiento == sentimiento;
  }

  @override
  int get hashCode => texto.hashCode ^ titulo.hashCode ^ sentimiento.hashCode;
}

class ResponseError {
  bool error;
  String nameError;
  String message;
  ResponseError({
    this.error,
    this.nameError,
    this.message,
  });

  ResponseError copyWith({
    bool error,
    String nameError,
    String message,
  }) {
    return ResponseError(
      error: error ?? this.error,
      nameError: nameError ?? this.nameError,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'nameError': nameError,
      'message': message,
    };
  }

  factory ResponseError.fromMap(Map<String, dynamic> map) {
    return ResponseError(
      error: map['error'],
      nameError: map['nameError'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseError.fromJson(String source) =>
      ResponseError.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseError(error: $error, nameError: $nameError, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseError &&
        other.error == error &&
        other.nameError == nameError &&
        other.message == message;
  }

  @override
  int get hashCode => error.hashCode ^ nameError.hashCode ^ message.hashCode;
}

class UpdateJournal {
  String texto;
  UpdateJournal({
    this.texto,
  });

  UpdateJournal copyWith({
    String texto,
  }) {
    return UpdateJournal(
      texto: texto ?? this.texto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'texto': texto,
    };
  }

  factory UpdateJournal.fromMap(Map<String, dynamic> map) {
    return UpdateJournal(
      texto: map['texto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateJournal.fromJson(String source) =>
      UpdateJournal.fromMap(json.decode(source));

  @override
  String toString() => 'UpdateJournal(texto: $texto)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateJournal && other.texto == texto;
  }

  @override
  int get hashCode => texto.hashCode;
}

class ResponseGratitud {
  bool error;
  String message;
  List<PracticaGratitud> data;
  ResponseGratitud({
    this.error,
    this.message,
    this.data,
  });

  ResponseGratitud copyWith({
    bool error,
    String message,
    List<PracticaGratitud> data,
  }) {
    return ResponseGratitud(
      error: error ?? this.error,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'message': message,
      'data': data?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ResponseGratitud.fromMap(Map<String, dynamic> map) {
    return ResponseGratitud(
      error: map['error'],
      message: map['message'],
      data: List<PracticaGratitud>.from(
          map['data']?.map((x) => PracticaGratitud.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseGratitud.fromJson(String source) =>
      ResponseGratitud.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseGratitud(error: $error, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseGratitud &&
        other.error == error &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => error.hashCode ^ message.hashCode ^ data.hashCode;
}

class PracticaGratitud {
  int idPract;
  String pregunta;
  PracticaGratitud({
    this.idPract,
    this.pregunta,
  });

  PracticaGratitud copyWith({
    int idPract,
    String pregunta,
  }) {
    return PracticaGratitud(
      idPract: idPract ?? this.idPract,
      pregunta: pregunta ?? this.pregunta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPract': idPract,
      'pregunta': pregunta,
    };
  }

  factory PracticaGratitud.fromMap(Map<String, dynamic> map) {
    return PracticaGratitud(
      idPract: map['idPract'],
      pregunta: map['pregunta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PracticaGratitud.fromJson(String source) =>
      PracticaGratitud.fromMap(json.decode(source));

  @override
  String toString() =>
      'PracticaGratitud(idPract: $idPract, pregunta: $pregunta)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PracticaGratitud &&
        other.idPract == idPract &&
        other.pregunta == pregunta;
  }

  @override
  int get hashCode => idPract.hashCode ^ pregunta.hashCode;
}

class RespondGratitud {
  int idPract;
  String texto;
  RespondGratitud({
    this.idPract,
    this.texto,
  });

  RespondGratitud copyWith({
    int idPract,
    String texto,
  }) {
    return RespondGratitud(
      idPract: idPract ?? this.idPract,
      texto: texto ?? this.texto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPract': idPract,
      'texto': texto,
    };
  }

  factory RespondGratitud.fromMap(Map<String, dynamic> map) {
    return RespondGratitud(
      idPract: map['idPract'],
      texto: map['texto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RespondGratitud.fromJson(String source) =>
      RespondGratitud.fromMap(json.decode(source));

  @override
  String toString() => 'RespondGratitud(idPract: $idPract, texto: $texto)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RespondGratitud &&
        other.idPract == idPract &&
        other.texto == texto;
  }

  @override
  int get hashCode => idPract.hashCode ^ texto.hashCode;
}

class ResponseJournalByDate {
  List<ResponseJournals> agno;
  List<ResponseJournals> dia;
  List<ResponseJournals> mes;
  bool error;
  String message;
  ResponseJournalByDate({
    this.agno,
    this.dia,
    this.mes,
    this.error,
    this.message,
  });

  ResponseJournalByDate copyWith({
    List<ResponseJournals> agno,
    List<ResponseJournals> dia,
    List<ResponseJournals> mes,
    bool error,
    String message,
  }) {
    return ResponseJournalByDate(
      agno: agno ?? this.agno,
      dia: dia ?? this.dia,
      mes: mes ?? this.mes,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'agno': agno?.map((x) => x.toMap())?.toList(),
      'dia': dia?.map((x) => x.toMap())?.toList(),
      'mes': mes?.map((x) => x.toMap())?.toList(),
      'error': error,
      'message': message,
    };
  }

  factory ResponseJournalByDate.fromMap(Map<String, dynamic> map) {
    return ResponseJournalByDate(
      agno: List<ResponseJournals>.from(
          map['agno']?.map((x) => ResponseJournals.fromMap(x))),
      dia: List<ResponseJournals>.from(
          map['dia']?.map((x) => ResponseJournals.fromMap(x))),
      mes: List<ResponseJournals>.from(
          map['mes']?.map((x) => ResponseJournals.fromMap(x))),
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseJournalByDate.fromJson(String source) =>
      ResponseJournalByDate.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseJournalByDate(agno: $agno, dia: $dia, mes: $mes, error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseJournalByDate &&
        listEquals(other.agno, agno) &&
        listEquals(other.dia, dia) &&
        listEquals(other.mes, mes) &&
        other.error == error &&
        other.message == message;
  }

  @override
  int get hashCode {
    return agno.hashCode ^
        dia.hashCode ^
        mes.hashCode ^
        error.hashCode ^
        message.hashCode;
  }
}

class ResponseGraphs {
  List<GraphData> data;
  bool error;
  String mensaje;
  ResponseGraphs({
    this.data,
    this.error,
    this.mensaje,
  });

  ResponseGraphs copyWith({
    List<GraphData> data,
    bool error,
    String mensaje,
  }) {
    return ResponseGraphs(
      data: data ?? this.data,
      error: error ?? this.error,
      mensaje: mensaje ?? this.mensaje,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x.toMap())?.toList(),
      'error': error,
      'mensaje': mensaje,
    };
  }

  factory ResponseGraphs.fromMap(Map<String, dynamic> map) {
    return ResponseGraphs(
      data: List<GraphData>.from(map['data']?.map((x) => GraphData.fromMap(x))),
      error: map['error'],
      mensaje: map['mensaje'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseGraphs.fromJson(String source) =>
      ResponseGraphs.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseGraphs(data: $data, error: $error, mensaje: $mensaje)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseGraphs &&
        listEquals(other.data, data) &&
        other.error == error &&
        other.mensaje == mensaje;
  }

  @override
  int get hashCode => data.hashCode ^ error.hashCode ^ mensaje.hashCode;
}

class GraphData {
  String emocion;
  String porciento;
  GraphData({
    this.emocion,
    this.porciento,
  });

  GraphData copyWith({
    String emocion,
    String porciento,
  }) {
    return GraphData(
      emocion: emocion ?? this.emocion,
      porciento: porciento ?? this.porciento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emocion': emocion,
      'porciento': porciento,
    };
  }

  factory GraphData.fromMap(Map<String, dynamic> map) {
    return GraphData(
      emocion: map['emocion'],
      porciento: map['porciento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GraphData.fromJson(String source) =>
      GraphData.fromMap(json.decode(source));

  @override
  String toString() => 'GraphData(emocion: $emocion, porciento: $porciento)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GraphData &&
        other.emocion == emocion &&
        other.porciento == porciento;
  }

  @override
  int get hashCode => emocion.hashCode ^ porciento.hashCode;
}

class ResponseGratitudRecords {
  List<GratitudOne> data;
  bool error;
  String message;
  ResponseGratitudRecords({
    this.data,
    this.error,
    this.message,
  });

  ResponseGratitudRecords copyWith({
    List<GratitudOne> data,
    bool error,
    String message,
  }) {
    return ResponseGratitudRecords(
      data: data ?? this.data,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x.toMap())?.toList(),
      'error': error,
      'message': message,
    };
  }

  factory ResponseGratitudRecords.fromMap(Map<String, dynamic> map) {
    return ResponseGratitudRecords(
      data: List<GratitudOne>.from(
          map['data']?.map((x) => GratitudOne.fromMap(x))),
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseGratitudRecords.fromJson(String source) =>
      ResponseGratitudRecords.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResponseGratitudRecords(data: $data, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseGratitudRecords &&
        listEquals(other.data, data) &&
        other.error == error &&
        other.message == message;
  }

  @override
  int get hashCode => data.hashCode ^ error.hashCode ^ message.hashCode;
}

class GratitudOne {
  String fecha;
  String pregunta;
  String respuesta;
  GratitudOne({
    this.fecha,
    this.pregunta,
    this.respuesta,
  });

  GratitudOne copyWith({
    String fecha,
    String pregunta,
    String respuesta,
  }) {
    return GratitudOne(
      fecha: fecha ?? this.fecha,
      pregunta: pregunta ?? this.pregunta,
      respuesta: respuesta ?? this.respuesta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fecha': fecha,
      'pregunta': pregunta,
      'respuesta': respuesta,
    };
  }

  factory GratitudOne.fromMap(Map<String, dynamic> map) {
    return GratitudOne(
      fecha: map['fecha'],
      pregunta: map['pregunta'],
      respuesta: map['respuesta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GratitudOne.fromJson(String source) =>
      GratitudOne.fromMap(json.decode(source));

  @override
  String toString() =>
      'GratitudOne(fecha: $fecha, pregunta: $pregunta, respuesta: $respuesta)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GratitudOne &&
        other.fecha == fecha &&
        other.pregunta == pregunta &&
        other.respuesta == respuesta;
  }

  @override
  int get hashCode => fecha.hashCode ^ pregunta.hashCode ^ respuesta.hashCode;
}

class ResponsePhrases {
  List<Phrase> data;
  bool error;
  String message;
  ResponsePhrases({
    this.data,
    this.error,
    this.message,
  });

  ResponsePhrases copyWith({
    List<Phrase> data,
    bool error,
    String message,
  }) {
    return ResponsePhrases(
      data: data ?? this.data,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x.toMap())?.toList(),
      'error': error,
      'message': message,
    };
  }

  factory ResponsePhrases.fromMap(Map<String, dynamic> map) {
    return ResponsePhrases(
      data: List<Phrase>.from(map['data']?.map((x) => Phrase.fromMap(x))),
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponsePhrases.fromJson(String source) => ResponsePhrases.fromMap(json.decode(source));

  @override
  String toString() => 'ResponsePhrases(data: $data, error: $error, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ResponsePhrases &&
      listEquals(other.data, data) &&
      other.error == error &&
      other.message == message;
  }

  @override
  int get hashCode => data.hashCode ^ error.hashCode ^ message.hashCode;
}

class Phrase {
  String autor;
  String frase;
  Phrase({
    this.autor,
    this.frase,
  });

  Phrase copyWith({
    String autor,
    String frase,
  }) {
    return Phrase(
      autor: autor ?? this.autor,
      frase: frase ?? this.frase,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'autor': autor,
      'frase': frase,
    };
  }

  factory Phrase.fromMap(Map<String, dynamic> map) {
    return Phrase(
      autor: map['autor'],
      frase: map['frase'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Phrase.fromJson(String source) => Phrase.fromMap(json.decode(source));

  @override
  String toString() => 'Phrase(autor: $autor, frase: $frase)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Phrase &&
      other.autor == autor &&
      other.frase == frase;
  }

  @override
  int get hashCode => autor.hashCode ^ frase.hashCode;
}
