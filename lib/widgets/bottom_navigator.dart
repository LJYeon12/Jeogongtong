import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/colors.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/study');
              break;
            case 2:
              Navigator.pushNamed(context, '/qna');
              break;
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/home_icon.svg"),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/study_icon.svg"),
              label: "Study"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/qna_icon.svg"),
              label: "QnA")
        ]);
  }
}
