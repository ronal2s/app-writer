import 'dart:convert';

class JournalModel {
  int id;
  String titulo;
  String sentimiento;
  String texto;

  JournalModel({
    this.id,
    this.titulo,
    this.sentimiento,
    this.texto,
  });

  JournalModel copyWith({
    int id,
    String titulo,
    String sentimiento,
    String texto,
  }) {
    return JournalModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      sentimiento: sentimiento ?? this.sentimiento,
      texto: texto ?? this.texto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'sentimiento': sentimiento,
      'texto': texto,
    };
  }

  factory JournalModel.fromMap(Map<String, dynamic> map) {
    return JournalModel(
      id: map['id'],
      titulo: map['titulo'],
      sentimiento: map['sentimiento'],
      texto: map['texto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JournalModel.fromJson(String source) =>
      JournalModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JournalModel(id: $id, titulo: $titulo, sentimiento: $sentimiento, texto: $texto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JournalModel &&
        other.id == id &&
        other.titulo == titulo &&
        other.sentimiento == sentimiento &&
        other.texto == texto;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        sentimiento.hashCode ^
        texto.hashCode;
  }
}
