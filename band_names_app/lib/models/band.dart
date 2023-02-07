// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Band {
  String id;
  String name;
  int votes;
  Band({
    required this.id,
    required this.name,
    required this.votes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'votes': votes,
    };
  }

  factory Band.fromMap(Map<String, dynamic> map) {
    return Band(
      id: map['id'] as String,
      name: map['name'] as String,
      votes: map['votes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Band.fromJson(String source) => Band.fromMap(json.decode(source) as Map<String, dynamic>);
}
