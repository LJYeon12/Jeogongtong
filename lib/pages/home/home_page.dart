import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/pages/help_page.dart';
import 'package:jeogongtong_front/pages/home_add_page.dart';
import 'package:jeogongtong_front/pages/home_my_page.dart';
import 'package:jeogongtong_front/pages/home_search_page.dart';
import 'package:jeogongtong_front/pages/models/roomModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _buttonColor1 = const Color(0xff131214);
  Color _buttonColor2 = const Color(0xff131214);
  Color _buttonColor3 = const Color(0xff131214);

  //예시 리스트
  static List<String> roomName = ['알고리즘', 'SQLD', '코딩테스트 준비'];
  static List<String> roomPage = ['room1', 'room2', 'room3'];
  final List<Room> exampleRoom = List.generate(
      roomName.length, (index) => Room(roomName[index], roomPage[index]));

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
                    MaterialPageRoute(builder: (_) => HomeSearchPage()),
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
                onTapUp: (_) {
                  setState(() {
                    _buttonColor2 = const Color(0xff131214);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => HomeAddPage()),
                  );
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
                    MaterialPageRoute(builder: (_) => HomeMyPage()),
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
            SizedBox(height: 13),
            Expanded(
              child: ListView.builder(
                itemCount: exampleRoom.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        exampleRoom[index].name,
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HelpPage()));
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
