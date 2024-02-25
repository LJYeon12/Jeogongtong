// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/models/add.dart';
import 'package:jeogongtong_front/widgets/count_button.dart';

final user = FirebaseAuth.instance.currentUser;

class HomeAddPage extends StatefulWidget {
  final Map<String, dynamic> user;
  const HomeAddPage({Key? key, required this.user}) : super(key: key);
  @override
  State<HomeAddPage> createState() => _HomeAddPageState();
}

class _HomeAddPageState extends State<HomeAddPage> {
  final TextEditingController _introController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bookController = TextEditingController();

  @override
  void dispose() {
    _bookController.dispose();
    _introController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  //드롭다운 버튼
  Color _buttonColor1 = const Color(0xff131214);
  Color _buttonColor2 = const Color(0xff131214);
  final _categoryList = [
    "경제/경영",
    "공무원/고시",
    "과학/공학",
    "수학",
    "어학/어문",
    "예체능",
    "입시",
    "취업",
    "컴퓨터/IT",
    "기타"
  ];
  String catalog = "";
  final _deadlineList = [
    "${DateTime.now().year}-01",
    "${DateTime.now().year}-02",
    "${DateTime.now().year}-03",
    "${DateTime.now().year}-04",
    "${DateTime.now().year}-05",
    "${DateTime.now().year}-06",
    "${DateTime.now().year}-07",
    "${DateTime.now().year}-08",
    "${DateTime.now().year}-09",
    "${DateTime.now().year}-10",
    "${DateTime.now().year}-11",
    "${DateTime.now().year}-12",
  ];
  String setting_period = "";

  //카운트 버튼
  int ranker_ask = 0;
  int ranker_answer = 0;

//POST
  Future<void> _sendData() async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/study-clubs/regist',
    );

    final String? idToken = await user?.getIdToken();
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $idToken' // UTF-8 컨텐츠 타입 헤더 추가
    };
    Add add = Add(
        intro: _introController.text,
        category: catalog,
        settingPeriod: setting_period,
        name: _nameController.text,
        book: _bookController.text,
        rankerAnswer: ranker_answer,
        rankerAsk: ranker_ask);
    try {
      final response =
          await http.Client().post(uri, headers: headers, body: add.toJson());
      if (response.statusCode == 200) {
        print('Data sent successfully: ${response.body}');
      } else {
        print('Failed to send data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('방이 개설되었습니다'),
      ),
    );
  }

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
              "방 개설하기",
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
                    _buttonColor1 = const Color(0xff131214);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 15),
                  constraints: const BoxConstraints(),
                  child: TextButton(
                    onPressed: () async {
                      await _sendData();
                      if (context.mounted) {
                        _showSnackbar(context);
                        Navigator.pop(context);
                      }
                    },
                    child: Text("완료",
                        style: TextStyle(fontSize: 18, color: _buttonColor2)),
                  ),
                ),
              )
            ],
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
                        "카테고리",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      buttonStyleData: ButtonStyleData(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xffE3E5E5),
                          ),
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        iconSize: 24,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                          maxHeight: 210,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          )),
                      hint: const Text(
                        "카테고리를 선택하세요",
                        style: TextStyle(fontSize: 16),
                      ),
                      value: catalog.isNotEmpty ? catalog : null,
                      items: _categoryList
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 16),
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            catalog = value!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "방 제목",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(방 정원은 200명으로 제한됩니다.)",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff6C7072),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        controller: _nameController,
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE3E5E5)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFC9AB8)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: "제목을 입력하세요.",
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Text(
                            "방 공지사항",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 150,
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          controller: _introController,
                          maxLines: null,
                          expands: true,
                          autofocus: false,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 24),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE3E5E5)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffFC9AB8)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            hintText: "공지사항을 입력하세요.",
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Text(
                            "사용할 책",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        controller: _bookController,
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE3E5E5)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFC9AB8)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: "사용할 책을 입력하세요.",
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "스터디방 마감 기한",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          buttonStyleData: ButtonStyleData(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xffE3E5E5),
                              ),
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                            iconSize: 24,
                          ),
                          dropdownStyleData: const DropdownStyleData(
                              maxHeight: 210,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              )),
                          hint: const Text(
                            "마감 기한을 선택하세요",
                            style: TextStyle(fontSize: 16),
                          ),
                          value:
                              setting_period.isNotEmpty ? setting_period : null,
                          items: _deadlineList
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(fontSize: 16),
                                  )))
                              .toList(),
                          onChanged: (value) {
                            setState(
                              () {
                                setting_period = value!;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "랭커 의무 질답(주 기준)",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(children: [
                        Row(
                          children: [
                            const Text(
                              "질문",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 13),
                            CountButton(
                              counter: ranker_ask,
                            ),
                            const SizedBox(width: 13),
                            const Text(
                              "회,",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ]),
                      const SizedBox(height: 16),
                      Column(children: [
                        Row(
                          children: [
                            const Text(
                              "답변",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 13),
                            CountButton(counter: ranker_answer),
                            const SizedBox(width: 13),
                            const Text(
                              "회",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ]),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
