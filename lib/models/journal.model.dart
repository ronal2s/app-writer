import 'dart:convert';

class JournalModel {
  String title;
  String feelings;
  String description;

  JournalModel({
    this.title,
    this.feelings,
    this.description,
  });

  JournalModel copyWith({
    String title,
    String feelings,
    String description,
  }) {
    return JournalModel(
      title: title ?? this.title,
      feelings: feelings ?? this.feelings,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'feelings': feelings,
      'description': description,
    };
  }

  factory JournalModel.fromMap(Map<String, dynamic> map) {
    return JournalModel(
      title: map['title'],
      feelings: map['feelings'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JournalModel.fromJson(String source) =>
      JournalModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'JournalModel(title: $title, feelings: $feelings, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JournalModel &&
        other.title == title &&
        other.feelings == feelings &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ feelings.hashCode ^ description.hashCode;
}
