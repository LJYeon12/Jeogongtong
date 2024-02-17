// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/models/post.dart';
import 'package:jeogongtong_front/pages/qna/qna_write.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';
import 'package:jeogongtong_front/widgets/question_widget.dart';

class QnAPage extends StatefulWidget {
  const QnAPage({super.key});
  static const routeName = '/qna';
  @override
  State<QnAPage> createState() => _QnAPageState();
}

class _QnAPageState extends State<QnAPage> {
  final List<String> _tempData = ["수학", "컴퓨터", "영어", "파이썬", "자바", "React"];
  // Post _sendPost(){

  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "질문 답변하기",
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: mainColor,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: _tempData.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                      ElevatedButton(onPressed: () {}, child: Text(category)),
                );
              }).toList()),
            ),
            const SizedBox(
              height: 35,
            ),
            const Column(
              children: [
                QuestionCard(
                  nickname: "김ㅇㅇ",
                  title: "Q.코딩 문제 도와주세요.",
                  commentCount: "2",
                ),
                QuestionCard(
                  nickname: "박ㅇㅇ",
                  title: "Q.영어 문제 도와주세요.",
                  commentCount: "7",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const QnaWritePage()),
                  );
                },
                label: const SizedBox(
                  width: 327,
                  child: Center(child: Text("질문 작성하기")),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    ));
  }
}
