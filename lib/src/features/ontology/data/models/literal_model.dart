import 'dart:convert';

class LiteralValue {
  LiteralValue({
    required this.type,
    required this.value,
  });

  factory LiteralValue.fromJson(String str) =>
      LiteralValue.fromMap(json.decode(str) as Map<String, dynamic>);

  factory LiteralValue.fromMap(Map<String, dynamic> json) => LiteralValue(
        type: json['type'] as String,
        value: json['value'] as String,
      );
  final String type;
  final String value;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'type': type,
        'value': value,
      };
}
