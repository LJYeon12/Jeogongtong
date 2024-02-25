import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/widgets/answer_widget.dart';

class QnAAnswerPage extends StatefulWidget {
  const QnAAnswerPage({super.key});

  @override
  State<QnAAnswerPage> createState() => _QnAAnswerPageState();
}

class _QnAAnswerPageState extends State<QnAAnswerPage> {
  Color _buttonColor1 = const Color(0xff131214);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "질문 답변하기",
              style: TextStyle(fontSize: 18),
            ),
            leadingWidth: 30,
            leading: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _buttonColor1 = const Color(0xffFC9AB8);
                });
              },
              onTapUp: (_) {
                setState(() {
                  _buttonColor1 = const Color(0xff131214);
                });
              },
              child: Transform.translate(
                offset: const Offset(7, 0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: SvgPicture.asset(
                    "assets/images/chevron-left.svg",
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _buttonColor1,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
        body: Column(children: [
          Answerpaper(
              content:
                  "이 문제 어떻게 푸나요... \nprint를 이용해 \"Hello World를 출력하세요.\"\n파이썬 문제입니다.. 도와주세요..",
              title: "Q.코딩 문제 도와주세요.",
              category: "컴퓨터/IT",
              user: "김나연"),
          Divider(
            indent: 0,
            thickness: 15,
            color: Color(0xffF2F4F5),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              "답변 0",
              style: TextStyle(fontSize: 16),
            ),
          )
        ]),
      ),
    );
  }
}
