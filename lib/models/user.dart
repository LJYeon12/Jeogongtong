// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String nickname;
  final String email;

  const User({
    required this.id,
    required this.nickname,
    required this.email,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, nickname, email];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nickname': nickname,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      nickname: map['nickname'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? nickname,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
    );
  }
}
