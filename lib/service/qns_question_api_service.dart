// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/models/post.dart';
import 'package:provider/provider.dart';

final user = FirebaseAuth.instance.currentUser;

class QnaQuestionApiService {
  final http.Client httpClient = http.Client();

  //<질문방> 질문 게시글 작성
  Future<http.Response> askingWrite(Post post) async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/questions/asking-write',
    );
    final String? idToken = await user?.getIdToken();

    try {
      http.Response response = await httpClient.post(uri,
          body: post.toJson(),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $idToken'
          });
      print(post.toJson());
      print(response.body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void dispose() {
    httpClient.close();
  }

  //<질문방> 질문 수정
  void askingEdit(Post post) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: apiHost,
      path: '/questions/edit',
    );
    try {
      await httpClient.patch(uri, body: post.toJson());
    } catch (e) {
      rethrow;
    }
  }

  //<질문방> 게시글 삭제
  void askingDelete(int id) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: apiHost,
      path: '/questions/delete/$id',
    );

    try {
      await httpClient.delete(uri);
    } catch (e) {
      rethrow;
    }
  }
}
