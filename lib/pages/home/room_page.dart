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
              "Room Management",
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
                "2024.02.26 10:32 AM",
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
                      "Manager",
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
                    "WELCOME!\nWe are crew!\nThis is Algorithm study.\nLet's study together.\n-Day routine : \nat least must do 2 hours",
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
