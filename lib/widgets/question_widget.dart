import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.nickname,
    required this.title,
    required this.commentCount,
  }) : super(key: key);
  final String nickname;
  final String title;
  final String commentCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: SizedBox(
          width: 327,
          height: 144,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("17시간 전"),
                    Row(
                      children: [
                        const Icon(Icons.comment),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(commentCount),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
