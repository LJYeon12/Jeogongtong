import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/pages/qna/qna_answer_page.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.nickname,
    required this.title,
    required this.comment,
    required this.today,
  }) : super(key: key);
  final String nickname;
  final String title;
  final String comment;
  final String today;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QnAAnswerPage(),
        ));
      },
      child: Card(
        elevation: 0,
        borderOnForeground: false,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: SizedBox(
          width: 327,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  comment,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(today),
                    SvgPicture.asset("assets/images/message-circle.svg")
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child:
                      const Divider(color: Color(0xffE3E5E5), thickness: 1.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
