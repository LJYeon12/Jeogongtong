import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoomPage extends StatefulWidget {
  //final int studyId;
  //const RoomPage({required this.studyId});
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  Color _buttonColor = const Color(0xff131214);

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
              "알고리즘",
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
        body: Column(
          children: [
            SizedBox(height: 13),
            Container(
              alignment: Alignment.center,
              child: Text(
                "2024.02.03 09:41 AM",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff979C9E),
                ),
              ),
            ),
            SizedBox(height: 13),
            Row(
              children: [
                SizedBox(width: 24),
                Column(
                  children: [
                    SizedBox(height: 68),
                    SvgPicture.asset(
                      "assets/images/emoji.svg",
                    ),
                    Text(
                      "방장",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: BoxDecoration(
                    color: Color(0xffFC9AB8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "이번 주 순위집계입니다. \n1위는 네모, \n2위는 동그라미, \n3위는 방장입니다.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              "2024.02.08 09:41 AM",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff979C9E),
              ),
            ),
            SizedBox(height: 13),
            Row(
              children: [
                SizedBox(width: 24),
                Column(
                  children: [
                    SizedBox(height: 68),
                    SvgPicture.asset(
                      "assets/images/emoji.svg",
                    ),
                    Text(
                      "방장",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: BoxDecoration(
                    color: Color(0xffFC9AB8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "동그라미님!\n답변 등록 완료를 내일까지\n마쳐야합니다.\n빨리 답변하세요!",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
