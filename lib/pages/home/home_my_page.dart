// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/pages/home/help_page.dart';
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/pages/home/point_page.dart';
import 'dart:developer';

import 'package:jeogongtong_front/widgets/grade_theme.dart';

class HomeMyPage extends StatefulWidget {
  const HomeMyPage({super.key});

  @override
  State<HomeMyPage> createState() => _HomeMyPageState();
}

class _HomeMyPageState extends State<HomeMyPage> {
  Color _buttonColor1 = const Color(0xff131214);
  Color _buttonColor2 = const Color(0xff131214);
  Color getColorForGrade(String grade) {
    switch (grade) {
      case 'Iron':
        return ColorStyles.Iron;
      case 'Bronze':
        return ColorStyles.Bronze;
      case 'Silver':
        return ColorStyles.Silver;
      case 'Gold':
        return ColorStyles.Gold;
      case 'Platinum':
        return ColorStyles.Platinum;
      case 'Diamond':
        return ColorStyles.Diamond;
      case 'Legend':
        return ColorStyles.Legend;
      default:
        return Colors.black;
    }
  }

//백엔드 연결
  late String _nickname = '';
  late String _grade = '';
  late int _score;
  late List<int> _rank = [];
  late String _email = '';
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/users/{userId}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = data['data']['user'];
        final studyRank = data['data']['studyRank'];
        final nickname = user['nickname'];
        final grade = user['grade'];
        final score = user['score'];
        final List<int> rank = studyRank['userId'];
        final email = user['email'];

        setState(() {
          _nickname = nickname;
          _grade = grade;
          _score = score;
          _rank = rank;
          _email = email;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log('Error: $e');
    }
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
              "마이페이지",
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
            actions: <Widget>[
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonColor2 = const Color(0xffFC9AB8);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _buttonColor2 = const Color(0xff131214);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HelpPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  constraints: const BoxConstraints(),
                  child: SvgPicture.asset(
                    "assets/images/help-circle.svg",
                    colorFilter:
                        ColorFilter.mode(_buttonColor2, BlendMode.srcIn),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 28),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "닉네임",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                        "ㅁㅁㅁㅁ",
                        //"$_nickname",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child:
                      const Divider(color: Color(0xffE3E5E5), thickness: 1.0),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "등급/포인트",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(Icons.local_police,
                          color: getColorForGrade(_grade), size: 24),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "320 p",
                        //"$_score p",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PointPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "포인트 지급 내역",
                            style: TextStyle(
                              color: Color(0xff979C9E),
                              fontSize: 14,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/chevron-right.svg",
                            width: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child:
                      const Divider(color: Color(0xffE3E5E5), thickness: 1.0),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "스터디 랭킹",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // 예시값
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "알고리즘",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "11위",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "SQLD",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "7위",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*
                ListView.builder(
                  itemCount: _rank.length,
                  itemBuilder: (context, index) {
                    final rankInfo = _rank[index];
                    return ListTile(
                      title: Text('Rank: ${rankInfo['rank']}'),
                      subtitle: Text('Role: ${rankInfo['role']}'),
                    );
                  },
                )
                */
                SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child:
                      const Divider(color: Color(0xffE3E5E5), thickness: 1.0),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "내 계정",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "$_email",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName));
                      },
                      child: Text(
                        "로그아웃",
                        style: TextStyle(
                          color: Color(0xffFC9AB8),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
