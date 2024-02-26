import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/models/post_answer.dart';

class QnaAnswerService {
  final http.Client httpClient = http.Client();

//<질문방>의 답변 게시글을 작성
  void answerWrite(Answer answer) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: apiHost,
      path: '/questions/answer-wirte',
    );

    try {
      await httpClient.post(uri, body: answer.toJson());
    } catch (e) {
      rethrow;
    }
  }

//<질문방>의 답변 게시글을 수정
  void answerEdit(Answer answer) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: apiHost,
      path: '/questions/answer-edit',
    );
    try {
      await httpClient.patch(uri, body: answer.toJson());
    } catch (e) {
      rethrow;
    }
  }

  //<질문방>의 답변 게시글 삭제
  void answerDelete(int id) async {
    final Uri uri = Uri(
      scheme: 'http',
      host: apiHost,
      path: '/questions/answer-delete/$id',
    );

    try {
      await httpClient.delete(uri);
    } catch (e) {
      rethrow;
    }
  }
}
