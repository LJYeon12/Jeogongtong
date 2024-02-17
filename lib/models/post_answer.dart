// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String? title;
  final String content;
  final String userId;
  final String questionId;
  final String category;
  const Answer({
    this.title,
    required this.content,
    required this.userId,
    required this.questionId,
    required this.category,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, content, userId, questionId, category];

  Answer copyWith({
    String? title,
    String? content,
    String? userId,
    String? questionId,
    String? category,
  }) {
    return Answer(
      title: title ?? this.title,
      content: content ?? this.content,
      userId: userId ?? this.userId,
      questionId: questionId ?? this.questionId,
      category: category ?? this.category,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'user_id': userId,
      'question_id': questionId,
      'category': category,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] as String,
      userId: map['user_id'] as String,
      questionId: map['question_id'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) =>
      Answer.fromMap(json.decode(source) as Map<String, dynamic>);
}
