import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) {
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
        items: [
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
