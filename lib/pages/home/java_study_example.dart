import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/pages/home/home_page.dart';

class JavaStudyExample extends StatefulWidget {
  const JavaStudyExample({super.key});

  @override
  State<JavaStudyExample> createState() => _JavaStudyExampleState();
}

class _JavaStudyExampleState extends State<JavaStudyExample> {
  Color _buttonColor = const Color(0xff131214);
  String name = "자바 기초";

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('공부방에 자바 기초 가 추가되었습니다'),
      ),
    );
  }

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
            title: Text(
              name,
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
        body: const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "카테고리",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "컴퓨터/IT",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "방 공지사항",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "Java를 함께 공부하고 싶은 분들을 모집합니다!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "사용할 책",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "Java의 정석",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "공부 기한",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "시작일 : 2023년 1월 1일\n5주",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "랭커 의무 질답(주 기준)",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "질문 : 4 회\n답변 : 3회",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                  MaterialPageRoute(
                      builder: (context) => HomePage(name: '자바 기초')),
                );

                _showSnackbar(context);
              },
              backgroundColor: Color(0xffFC9AB8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0),
              ),
              child: Text(
                '스터디 참여하기',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              elevation: 2.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
