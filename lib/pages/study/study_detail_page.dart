import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/pages/study/study_page.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';

class StudyDetailPage extends StatefulWidget {
  const StudyDetailPage({Key? key}) : super(key: key);

  @override
  State<StudyDetailPage> createState() => _StudyDetailPageState();
}

class _StudyDetailPageState extends State<StudyDetailPage> {
  late Timer _timer;
  int seconds = 0;
  bool isTimerRunning = false;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
    setState(() {
      isTimerRunning = true;
    });
  }

  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      isTimerRunning = false;
    });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('공부 시간'),
          content: Text('총 ${_formatTime(seconds)} 동안 공부했습니다!'),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BottomNavigator(),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Color _buttonColor = const Color(0xff131214);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Java",
              style: TextStyle(fontSize: 18),
            ),
            leadingWidth: 30,
            leading: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _buttonColor = const Color(0xffFC9AB8);
                });
              },
              onTapUp: (_) {
                setState(() {
                  _buttonColor = const Color(0xff131214);
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
                      _buttonColor,
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 340,
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          _formatTime(seconds),
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            isTimerRunning
                                ? "assets/images/pause.svg"
                                : "assets/images/play.svg",
                            width: 50,
                            height: 50,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            if (isTimerRunning) {
                              _pauseTimer();
                              _showAlertDialog(context);
                            } else {
                              _startTimer();
                            }
                          },
                        ),
                      ],
                    ),
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
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    List<String> listEx = [
                      "완전열심",
                      "박서연",
                      "이나영",
                      "박상윤",
                      "곰돌이",
                      "고양이",
                      "안녕하세요",
                      "김나연",
                    ];
                    List<String> time = [
                      "06:02:39",
                      "05:48:52",
                      "03:55:50",
                      "03:44:10",
                      "01:50:45",
                      "00:01:50",
                      "00:30:10",
                      "00:00:10"
                    ];
                    return ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 조정
                        title: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // 요소들을 양쪽에 배치
                          children: [
                            Text('${index + 1}. ${listEx[index]}'),
                            Text(time[index]), // 시간 표시
                          ],
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
