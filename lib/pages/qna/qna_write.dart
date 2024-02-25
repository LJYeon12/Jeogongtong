import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/models/post.dart';
import 'package:jeogongtong_front/service/qns_question_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:http/http.dart' as http;

final user = FirebaseAuth.instance.currentUser;

String formatDate(DateTime date) {
  // 날짜 형식 지정
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // 날짜를 형식에 맞게 변환하여 반환
  return formatter.format(date);
}

class QnaWritePage extends StatefulWidget {
  const QnaWritePage({super.key});

  @override
  State<QnaWritePage> createState() => _QnaWritePageState();
}

class _QnaWritePageState extends State<QnaWritePage> {
  Color _buttonColor = const Color(0xff131214);
  final List<String> _category = [
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
  String formattedDate = formatDate(DateTime.now());
  late Map<String, dynamic> uusers;
  String _selectedCategory = '';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final QnaQuestionApiService qnaQuestionApiService = QnaQuestionApiService();

  //유저 정보 get 받기
  Future<void> _userdata() async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/',
    );

    final String? idToken = await user?.getIdToken();
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${idToken!}'
    });
    //print(idToken);
    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      Map<String, dynamic> studyroom = jsonDecode(responseBody);
      Map<String, dynamic> mu = studyroom['user'];
      print(mu);
      setState(() {
        uusers = mu;
      });
    } else {
      throw Exception('Failed!');
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedCategory = _category[0];
    _userdata();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submit() async {
    Post post = Post(
      category: _selectedCategory,
      title: _titleController.text,
      content: _contentController.text,
      regiDate: formattedDate,
      photoUrl: "22",
      //users: uusers,
    );
    try {
      http.Response response = await qnaQuestionApiService.askingWrite(post);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('질문을 작성하였습니다')),
        );
        // 포스트 성공 시 팝
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('질문 작성을 하지 못했습니다')),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류가 발생했습니다')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "질문 작성하기",
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: TextButton(
                  onPressed: () {
                    _submit();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffFC9AB8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 24,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: Text(
                        '완료',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                        value: _selectedCategory.isNotEmpty
                            ? _selectedCategory
                            : null,
                        items: _category
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
                              _selectedCategory = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    controller: _titleController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "제목을 입력하세요.",
                      hintStyle: TextStyle(
                          fontSize: 32,
                          color: Color(0xff979C9E),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 540,
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      maxLines: null,
                      expands: true,
                      controller: _contentController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "질문을 작성하세요.",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xff979C9E),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
