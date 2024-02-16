import 'package:flutter/material.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/models/post.dart';

class QnAPage extends StatefulWidget {
  const QnAPage({super.key});

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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: _tempData.map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(onPressed: () {}, child: Text(category)),
              );
            }).toList()),
          ),
          const SizedBox(
            height: 35,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
              child: SizedBox(
                width: 327,
                height: 144,
                child: Text("제목"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const SizedBox(
                width: 327,
                child: Center(child: Text("질문 작성하기")),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
