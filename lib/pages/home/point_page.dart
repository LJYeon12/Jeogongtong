import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PointPage extends StatefulWidget {
  //final int score;
  //const PointPage({Key? key, required this.score}) : super(key: key);
  const PointPage({super.key});
  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  Color _buttonColor = const Color(0xff131214);
  List<List<dynamic>> listEx = [
    ["주간 스터디", 45],
    ["주간 스터디", 40],
    ["질문 작성", 20],
    ["질문 답변", 20],
    ["주간 스터디", 51],
    ["질문 작성", 20]
  ];
  List<String> dateEx = [
    "2024년 2월 20일",
    "2024년 2월 13일",
    "2024년 2월 11일",
    "2024년 2월 9일",
    "2024년 2월 6일",
    "2024년 2월 6일",
  ];

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
              "포인트 지급 내역",
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
            SizedBox(height: 28),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    //widget.score.toString() + " p",
                    "내 포인트 : 320 p",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Divider(color: Color(0xffE3E5E5), thickness: 1.0),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: listEx.length,
                itemBuilder: (context, index) {
                  final item = listEx[index];
                  final date = dateEx[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item[0],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item[1].toString(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(
                          color: Color(0xffE3E5E5),
                          thickness: 1.0,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
