import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/widgets/grade_theme.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  Color _buttonColor1 = const Color(0xff131214);
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
              "도움말",
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
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 28),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "승급 기준",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Iron,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "아이언 : 300p 미만",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Bronze,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "브론즈 : 300p ~ 3,999p",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Silver,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "실버 : 4,000p ~ 8,999p",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Gold,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "골드 : 9,000p ~ 19,999p",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Platinum,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "플래티넘 : 20,000p ~ 59,999p",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Diamond,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "다이아몬드 : 60,000p ~ 99,999p",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_police,
                        size: 24,
                        color: ColorStyles.Legend,
                      ),
                      SizedBox(width: 9),
                      Text(
                        "레전드 : 100,000p ~ 300,000p",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child:
                      const Divider(color: Color(0xffE3E5E5), thickness: 1.0),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      Text(
                        "포인트 지급 기준",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "스터디 랭킹에 따라",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1위는 3000p,",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "2위는 2500p,",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "3위는 1800p를 지급하며,",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "스터디 랭커가 아닐 경우 주당 하루 평균 공부 시간에 100을 곱하여 지급합니다.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "또한 질문, 답변을 할 경우 100p를 지급합니다.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "주당 하루 평균 공부 시간이 1시간 이하인 회원은 유령 회원으로 집계되어 포인트를 받을 수 없습니다.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
