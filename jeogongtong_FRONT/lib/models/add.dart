import 'dart:convert';
import 'package:equatable/equatable.dart';

class Add extends Equatable {
  final String intro;
  final String category;
  //final Map<String, dynamic> users;
  final String settingPeriod;
  final String name;
  final String book;
  final int rankerAsk;
  final int rankerAnswer;

  const Add(
      {required this.intro,
      required this.category,
      //required this.users,
      required this.settingPeriod,
      required this.name,
      required this.book,
      required this.rankerAnswer,
      required this.rankerAsk});

  @override
  List<Object?> get props => [
        intro,
        name,
        book,
        settingPeriod,
        category,
        rankerAnswer,
        rankerAsk
      ]; //users];

  Add copyWith({
    String? intro,
    String? name,
    String? book,
    String? settingPeriod,
    //Map<String, dynamic>? users,
    String? category,
    int? rankerAnswer,
    int? rankerAsk,
  }) {
    return Add(
      intro: intro ?? this.intro,
      name: name ?? this.name,
      //users: users ?? this.users,
      category: category ?? this.category,
      book: book ?? this.book,
      settingPeriod: settingPeriod ?? this.settingPeriod,
      rankerAnswer: rankerAnswer ?? this.rankerAnswer,
      rankerAsk: rankerAsk ?? this.rankerAsk,
    );
  }

  factory Add.fromMap(Map<String, dynamic> map) {
    return Add(
      intro: map['intro'] as String,
      name: map['name'] as String,
      //users: map['users'] as Map<String, dynamic>,
      category: map['category'] as String,
      book: map['book'] as String,
      settingPeriod: map['settingPeriod'] as String,
      rankerAnswer: map['rankerAnswer'] as int,
      rankerAsk: map['rankerAsk'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'intro': intro,
      'name': name,
      //'users': users,
      'category': category,
      'book': book,
      'settingPeriod': settingPeriod,
      'rankerAnswer': rankerAnswer,
      'rankerAsk': rankerAsk,
    };
  }

  String toJson() => json.encode(toMap());

  factory Add.fromJson(String source) =>
      Add.fromMap(json.decode(source) as Map<String, dynamic>);
}
