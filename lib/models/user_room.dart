import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserRoom extends Equatable {
  final String nickname;
  final int id;
  final String email;
  final int point;

  const UserRoom({
    required this.id,
    required this.nickname,
    required this.email,
    required this.point,
  });

  @override
  List<Object?> get props => [id, nickname, email, point];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'id': id,
      'email': email,
      'point': point,
    };
  }

  factory UserRoom.fromMap(Map<String, dynamic> map) {
    return UserRoom(
      nickname: map['nickname'] as String,
      id: map['id'] as int,
      email: map['email'] as String,
      point: map['point'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRoom.fromJson(String source) =>
      UserRoom.fromMap(json.decode(source) as Map<String, dynamic>);

  UserRoom copyWith({
    String? idToken,
    String? nickname,
    int? userId,
    int? point,
  }) {
    return UserRoom(
      nickname: nickname ?? this.nickname,
      id: id ?? this.id,
      email: email ?? this.email,
      point: point ?? this.point,
    );
  }
}
