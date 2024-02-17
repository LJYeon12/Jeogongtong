import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/pages/home/help_page.dart';

class HomeMyPage extends StatefulWidget {
  const HomeMyPage({super.key});

  @override
  State<HomeMyPage> createState() => _HomeMyPageState();
}

class _HomeMyPageState extends State<HomeMyPage> {
  Color _buttonColor1 = const Color(0xff131214);
  Color _buttonColor2 = const Color(0xff131214);

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
            title: const Text(
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
                    MaterialPageRoute(builder: (_) => const HelpPage()),
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
        body: const Column(
          children: [
            SizedBox(height: 28),
            Padding(
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
          ],
        ),
      ),
    );
  }
}
