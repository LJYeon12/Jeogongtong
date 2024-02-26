import 'package:flutter/material.dart';
import 'package:jeogongtong_front/widgets/grade_theme.dart';

class Answerpaper extends StatelessWidget {
  final String content;
  final String title;
  final String category;
  final String user;
  const Answerpaper({
    Key? key,
    required this.content,
    required this.title,
    required this.category,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "Q. $content",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            category,
            style: TextStyle(fontSize: 12, color: Color(0xffFC9AB8)),
          ),
          Row(
            children: [
              Text(
                user,
                style: TextStyle(fontSize: 12),
              ),
              Icon(
                Icons.local_police,
                color: ColorStyles.Silver,
              )
            ],
          ),
        ],
      ),
    );
  }
}
