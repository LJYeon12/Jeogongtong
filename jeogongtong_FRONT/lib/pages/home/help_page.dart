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
              "Help",
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
                        "Tier promotion criteria",
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
                        "Iron : less than 300p",
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
                        "Bronze : 300p ~ 3,999p",
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
                        "Silver : 4,000p ~ 8,999p",
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
                        "Gold : 9,000p ~ 19,999p",
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
                        "Platinum : 20,000p ~ 59,999p",
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
                        "Diamond : 60,000p ~ 99,999p",
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
                        "Legend : 100,000p ~ 300,000p",
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
                        "Point savings standard",
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
                        "According to study ranking",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1st gets 3000p,",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "2nd gets 2500p,",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "3rd gets 1800p.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "If you are not a study ranker, you will be paid by multiplying the average study time per day per week by 100.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Also, if you ask or answer a question, you will receive 100p.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Members whose average study time per day per week is less than 1 hour are counted as ghost members and cannot receive points.",
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
