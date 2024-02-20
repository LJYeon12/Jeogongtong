import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:jeogongtong_front/pages/home/home_add_page.dart';
import 'package:jeogongtong_front/pages/home/home_my_page.dart';
import 'package:jeogongtong_front/pages/home/home_search_page.dart';
import 'package:jeogongtong_front/pages/home/java_study_example.dart';
import 'package:jeogongtong_front/models/api_adapter.dart';
import 'package:jeogongtong_front/models/study_room_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jeogongtong_front/pages/home/room_page.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';

class HomePage extends StatefulWidget {
  final String? name;
  const HomePage({Key? key, this.name}) : super(key: key);
  static const routeName = "/home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _buttonColor1 = const Color(0xff131214);
  Color _buttonColor2 = const Color(0xff131214);
  Color _buttonColor3 = const Color(0xff131214);
  List<String> nameExample = ['알고리즘', 'SQLD', '코딩테스트 준비'];

  // ignore: non_constant_identifier_names
  void addStudyName(String study_name) {
    setState(() {
      nameExample.add(study_name);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.name != null) {
      nameExample.add(widget.name!);
    }
  }

  //전달받은 값
  List<int> studyIds = [];
  List<String> names = [];
  bool isLoading = false;
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse('http://localhost:8080/'));
    if (response.statusCode == 200) {
      final List<StudyRoom> myroom = parseRoom(utf8.decode(response.bodyBytes));

      setState(() {
        final List<int> studyIds = myroom.map((room) => room.studyId).toList();
        final List<String> names = myroom.map((room) => room.name).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed!');
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
            title: const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "나의 공부방",
                style: TextStyle(fontSize: 18),
              ),
            ),
            titleSpacing: 0,
            actions: <Widget>[
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonColor1 = const Color(0xffFC9AB8);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _buttonColor1 = const Color(0xff131214);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeSearchPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  constraints: const BoxConstraints(),
                  child: SvgPicture.asset(
                    "assets/images/search.svg",
                    colorFilter:
                        ColorFilter.mode(_buttonColor1, BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonColor2 = const Color(0xffFC9AB8);
                  });
                },
                onTapUp: (_) async {
                  setState(() {
                    _buttonColor2 = const Color(0xff131214);
                  });
                  final study_name = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeAddPage()),
                  );
                  if (study_name != null) {
                    addStudyName(study_name);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  constraints: const BoxConstraints(),
                  child: SvgPicture.asset(
                    "assets/images/plus.svg",
                    colorFilter:
                        ColorFilter.mode(_buttonColor2, BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonColor3 = const Color(0xffFC9AB8);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _buttonColor3 = const Color(0xff131214);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeMyPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  constraints: const BoxConstraints(),
                  child: SvgPicture.asset(
                    "assets/images/emoji.svg",
                    colorFilter:
                        ColorFilter.mode(_buttonColor3, BlendMode.srcIn),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 13),
            Expanded(
              child: ListView.builder(
                itemCount: nameExample.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        nameExample[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RoomPage()));
                      });
                },
              ),
              /*
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        names[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        int selectedStudyId = studyIds[index];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                RoomPage(studyId: selectedStudyId)));
                      });
                },
              ),
              */
            )
          ],
        ),
      ),
    );
  }
}
