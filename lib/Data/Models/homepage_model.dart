import 'dart:convert';

class HomePageMode {
  final String userID;
  final String text;
  final String type;

  HomePageMode(
    this.userID,
    this.text,
    this.type,
  );

  HomePageMode copyWith({
    String? userID,
    String? text,
    String? type,
  }) {
    return HomePageMode(
      userID ?? this.userID,
      text ?? this.text,
      type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': userID,
      'text': text,
      'type': type,
    };
  }

  factory HomePageMode.fromMap(Map<String, dynamic> map) {
    return HomePageMode(
      map['_id'] ?? '',
      map['text'] ?? '',
      map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePageMode.fromJson(String source) =>
      HomePageMode.fromMap(json.decode(source));

  @override
  String toString() =>
      'HomePageMode(userID: $userID, text: $text, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageMode &&
        other.userID == userID &&
        other.text == text &&
        other.type == type;
  }

  @override
  int get hashCode => userID.hashCode ^ text.hashCode ^ type.hashCode;
}
