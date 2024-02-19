// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String? title;
  final String content;
  final String userId;
  final String category;
  const Post({
    required this.title,
    required this.content,
    required this.userId,
    required this.category,
  });

  @override
  List<Object?> get props => [title, content, userId, category];

  Post copyWith({
    String? title,
    String? content,
    String? userId,
    String? category,
  }) {
    return Post(
      title: title ?? this.title,
      content: content ?? this.content,
      userId: userId ?? this.userId,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'user_id': userId,
      'category': category,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      content: map['content'] as String,
      userId: map['user_id'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
