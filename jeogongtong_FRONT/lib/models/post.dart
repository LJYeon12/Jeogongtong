import 'dart:convert';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String title;
  final String content;
  //final Map<String, dynamic> users;
  final String category;
  final String regiDate;
  final String photoUrl;

  const Post(
      {required this.title,
      required this.content,
      //required this.users,
      required this.category,
      required this.regiDate,
      required this.photoUrl});

  @override
  List<Object?> get props =>
      [title, content, category, regiDate, photoUrl]; //users];

  Post copyWith({
    String? title,
    String? content,
    String? regiDate,
    //Map<String, dynamic>? users,
    String? category,
    String? photoUrl,
  }) {
    return Post(
      title: title ?? this.title,
      content: content ?? this.content,
      //users: users ?? this.users,
      category: category ?? this.category,
      regiDate: regiDate ?? this.regiDate,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      content: map['content'] as String,
      //users: map['users'] as Map<String, dynamic>,
      category: map['category'] as String,
      regiDate: map['regiDate'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      //'users': users,
      'category': category,
      'regiDate': regiDate,
      'photoUrl': photoUrl
    };
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
