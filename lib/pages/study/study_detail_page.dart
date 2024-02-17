import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeogongtong_front/constants/colors.dart';

class StudyDetailPage extends StatefulWidget {
  const StudyDetailPage({super.key});

  @override
  State<StudyDetailPage> createState() => _StudyDetailPageState();
}

class _StudyDetailPageState extends State<StudyDetailPage> {
  late Timer _timer;
  int seconds = 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("알고리즘"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 13,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFC9AB8),
                    borderRadius: BorderRadius.circular(8)),
                width: 327,
                height: 140,
                child: const Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "00:00:00",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        )
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const Divider(
              color: Color(0xffE3E5E5),
            ),
            const SizedBox(
              height: 13,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "순위",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
