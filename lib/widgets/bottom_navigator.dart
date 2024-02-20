import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/pages/home/home_page.dart';
import 'package:jeogongtong_front/pages/qna/qna_page.dart';
import 'package:jeogongtong_front/pages/study/study_page.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    StudyPage(),
    QnAPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Color(0xff979C9E),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/home_icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/images/home_icon.svg",
                colorFilter:
                    ColorFilter.mode(const Color(0xffFC9AB8), BlendMode.srcIn),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/study_icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/images/study_icon.svg",
                colorFilter:
                    ColorFilter.mode(const Color(0xffFC9AB8), BlendMode.srcIn),
              ),
              label: "Study"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/qna_icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/images/qna_icon.svg",
                colorFilter:
                    ColorFilter.mode(const Color(0xffFC9AB8), BlendMode.srcIn),
              ),
              label: "QnA")
        ],
      ),
    );
  }

  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
