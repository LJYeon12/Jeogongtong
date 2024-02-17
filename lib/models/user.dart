// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String nickname;
  final String idToken;
  const User({
    required this.idToken,
    required this.nickname,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [idToken, nickname];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'idToken': idToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nickname: map['nickname'] as String,
      idToken: map['idToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? idToken,
    String? nickname,
  }) {
    return User(
        nickname: nickname ?? this.nickname, idToken: idToken ?? this.idToken);
  }
}
