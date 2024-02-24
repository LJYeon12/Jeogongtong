// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/pages/home/help_page.dart';
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/pages/home/point_page.dart';
import 'package:jeogongtong_front/pages/signup/signup_page.dart';
import 'package:jeogongtong_front/provider/auth/auth_provider.dart'
    as AppAuthProvider;
import 'dart:developer';

import 'package:jeogongtong_front/widgets/grade_theme.dart';
import 'package:provider/provider.dart';

final user = FirebaseAuth.instance.currentUser;

class HomeMyPage extends StatefulWidget {
  final int userId;
  const HomeMyPage({Key? key, required this.userId}) : super(key: key);
  @override
  State<HomeMyPage> createState() => _HomeMyPageState();
}

class _HomeMyPageState extends State<HomeMyPage> {
  Color _buttonColor1 = const Color(0xff131214);
  Color _buttonColor2 = const Color(0xff131214);
  Color getColorForGrade(String grade) {
    switch (grade) {
      case 'ion':
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
        return Colors.white;
    }
  }

//백엔드 연결
  late String _nickname = '';
  late String _tier = '';
  late int _point = 0;
  late List<dynamic> _studyName = [];
  late List<dynamic> _state = [];
  late List<dynamic> _rank = [];
  late String _email = '';
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/users/${widget.userId}',
    );
    final String? idToken = await user?.getIdToken();
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${idToken}'
    });
    try {
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        print(data);
        final user = data['user'];
        final studyRank = data['studyRank'];
        final nickname = user['nickname'];
        final point = user['point'];
        final tier = user['tier'];
        final studyName = [];
        final state = [];
        final rank = [];
        for (var index in studyRank) {
          studyName.add(index['studyName']);
          state.add(index['state']);
          rank.add(index['rank']);
        }
        final email = user['email'];

        setState(() {
          _nickname = nickname;
          _point = point;
          _tier = tier;
          _studyName = studyName;
          _state = state;
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
        body: _nickname.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                              "$_nickname",
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
                        child: const Divider(
                            color: Color(0xffE3E5E5), thickness: 1.0),
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
                                color: getColorForGrade(_tier),
                                size: 24), //getColorForGrade(_grade)
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              "${_point} p",
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
                                //builder: (_) => PointPage(score: _score)),
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
                        child: const Divider(
                            color: Color(0xffE3E5E5), thickness: 1.0),
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
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _studyName.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 0),
                                title: Text(
                                  "${_studyName[index]}(${_state[index]})",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                trailing: Text(
                                  "${_rank[index]}위",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: const Divider(
                            color: Color(0xffE3E5E5), thickness: 1.0),
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
                              context
                                  .read<AppAuthProvider.AuthProvider>()
                                  .signout();
                              print('로그아웃');
                              Navigator.popUntil(context,
                                  ModalRoute.withName(SignUpPage.routeName));
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
