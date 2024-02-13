// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/models/post.dart';

class QnaQuestionApiService {
  final http.Client httpClient;
  QnaQuestionApiService({
    required this.httpClient,
  });

  //<질문방> 질문 게시글 작성
  void askingWrite(Post post) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: apiHost,
      path: '/questions/asking-write',
    );

    try {
      await httpClient.post(uri, body: post.toJson());
    } catch (e) {
      rethrow;
    }
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
