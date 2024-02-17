// ignore_for_file: non_constant_identifier_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/pages/home/home_page.dart';
import 'package:jeogongtong_front/widgets/count_button.dart';

class HomeAddPage extends StatefulWidget {
  const HomeAddPage({super.key});

  @override
  State<HomeAddPage> createState() => _HomeAddPageState();
}

class _HomeAddPageState extends State<HomeAddPage> {
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
  final _deadlineList = ["2주", "3주", "4주", "5주", "6주", "7주", "8주"];
  String setting_period = "";

  //텍스트 폼 필드
  final formKey = GlobalKey<FormState>();
  String study_name = '';
  String intro = '';
  String book = '';

  //카운트 버튼
  int ranker_ask = 0;
  int ranker_answer = 0;

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
                      if (formKey.currentState != null) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
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
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Zㄱ-ㅎ가-힣0-9]'),
                              ),
                            ],
                            maxLength: 20,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFC9AB8))),
                              hintText: "제목을 입력하세요",
                              hintStyle: const TextStyle(fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE3E5E5))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFC9AB8))),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                            ),
                            onSaved: (value) {
                              setState(() {
                                study_name = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '1자 이상 입력해주세요.';
                              } else if (value.length > 20) {
                                return '20자 이하로 입력해주세요.';
                              }
                              return null;
                            },
                          ),
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
                          TextFormField(
                            minLines: 5,
                            maxLines: 5,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Zㄱ-ㅎ가-힣0-9]'),
                              ),
                            ],
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFC9AB8))),
                              hintText: "공지사항을 입력하세요",
                              hintStyle: const TextStyle(fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE3E5E5))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFC9AB8))),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 10),
                            ),
                            onSaved: (value) {
                              setState(() {
                                intro = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '1자 이상 작성해주세요.';
                              } else if (value.length > 100) {
                                return '100자 이내로 작성해주세요.';
                              }
                              return null;
                            },
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
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Zㄱ-ㅎ가-힣0-9]'),
                              ),
                            ],
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFC9AB8))),
                              hintText: "사용할 책을 입력하세요",
                              hintStyle: const TextStyle(fontSize: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE3E5E5))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffFC9AB8))),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                            ),
                            onSaved: (value) {
                              setState(() {
                                book = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '1자 이상 입력해주세요.';
                              } else if (value.length > 20) {
                                return '20자 이하로 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        "공부 기한",
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
                        "공부할 기한을 선택하세요",
                        style: TextStyle(fontSize: 16),
                      ),
                      value: setting_period.isNotEmpty ? setting_period : null,
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
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
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
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(children: [
                    Row(
                      children: [
                        const Text(
                          "질문",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 13),
                        CountButton(counter: 0),
                        const SizedBox(width: 13),
                        const Text(
                          "회,",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(children: [
                    Row(
                      children: [
                        const Text(
                          "답변",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 13),
                        CountButton(counter: 0),
                        const SizedBox(width: 13),
                        const Text(
                          "회",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
