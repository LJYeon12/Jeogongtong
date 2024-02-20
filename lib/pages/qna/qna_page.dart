// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/models/post.dart';
import 'package:jeogongtong_front/pages/home/home_search_page.dart';
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
  Color _buttonColor = const Color(0xff131214);
  final List<String> _tempData = [
    "경제/경영",
    "공무원/고시",
    "과학/공학",
    "수학",
    "어학/어문",
    "예체능",
    "입시",
    "취업",
    "컴퓨터/IT",
    "기타"
  ];
  // Post _sendPost(){

  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "질문 답변하기",
                style: TextStyle(fontSize: 18),
              ),
            ),
            titleSpacing: 0,
            actions: <Widget>[
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonColor = const Color(0xffFC9AB8);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _buttonColor = const Color(0xff131214);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeSearchPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  constraints: const BoxConstraints(),
                  child: SvgPicture.asset(
                    "assets/images/search.svg",
                    colorFilter:
                        ColorFilter.mode(_buttonColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
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
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 24,
            height: 48,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QnaWritePage()),
                );
              },
              backgroundColor: Color(0xffFC9AB8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0),
              ),
              child: Text(
                '질문 작성하기',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              elevation: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
