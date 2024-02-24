import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';
import 'package:http/http.dart' as http;

final user = FirebaseAuth.instance.currentUser;

class SelectedStudyInfo extends StatelessWidget {
  final Map<String, dynamic>? selectedStudy;

  const SelectedStudyInfo({Key? key, this.selectedStudy}) : super(key: key);

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('공부방에 추가되었습니다'),
      ),
    );
  }

//post
  Future<void> _joinStudyGroup(BuildContext context) async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/study-member/apply',
      queryParameters: {'studyId': selectedStudy!['studyId'].toString()},
    );

    final String? idToken = await user?.getIdToken();
    final response = await http.post(
      uri,
      body: jsonEncode({
        'name': selectedStudy!['name'],
        'book': selectedStudy!['book'],
        'category': selectedStudy!['category'],
        'settingPeriod': selectedStudy!['settingPeriod'],
        'rankerAsk': selectedStudy!['rankerAsk'],
        'rankerAnswer': selectedStudy!['rankerAnswer'],
        'intro': selectedStudy!['intro'],
        'createdTime': selectedStudy!['createTime'],
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${idToken}'
      },
    );
    print(selectedStudy!);
    if (response.statusCode == 200) {
      _showSnackbar(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigator()),
      );
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('참여에 실패하였습니다'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedStudy != null) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                '${selectedStudy!['name']}',
                style: TextStyle(fontSize: 18),
              ),
              leadingWidth: 30,
              leading: GestureDetector(
                child: Transform.translate(
                  offset: const Offset(7, 0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: SvgPicture.asset(
                      "assets/images/chevron-left.svg",
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
          body: SizedBox(
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
                          "방 제목",
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
                          '${selectedStudy!['name']}',
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
                          '${selectedStudy!['category']}',
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
                          '${selectedStudy!['intro']}',
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
                          '${selectedStudy!['book']}',
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
                          '공부 기한 : ${selectedStudy!['createdTime']} ~ ${selectedStudy!['settingPeriod']}',
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
                          "질문 : ${selectedStudy!['rankerAsk']} 회\n답변 : ${selectedStudy!['rankerAnswer']} 회",
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
                  _joinStudyGroup(context);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      ); // If no study is selected
    }
  }
}
