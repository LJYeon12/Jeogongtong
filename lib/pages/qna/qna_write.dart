import 'dart:io';
import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:jeogongtong_front/models/post.dart';
import 'package:jeogongtong_front/service/qns_question_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:http/http.dart' as http;

class QnaWritePage extends StatefulWidget {
  const QnaWritePage({super.key});

  @override
  State<QnaWritePage> createState() => _QnaWritePageState();
}

class _QnaWritePageState extends State<QnaWritePage> {
  final List<String> _category = ['컴퓨터/IT', '어학/어문', '수학', '과학/공학'];
  String? _selectedCategory = '';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final QnaQuestionApiService qnaQuestionApiService = QnaQuestionApiService();

  @override
  void initState() {
    super.initState();
    _selectedCategory = _category[0];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submit() async {
    Post post = Post(
        category: _selectedCategory!,
        title: _titleController.text,
        content: _contentController.text,
        userId: "1");
    try {
      http.Response response = await qnaQuestionApiService.askingWrite(post);
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("질문 작성하기"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Row(
              children: [
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        foregroundColor: Colors.white,
                        backgroundColor: buttonColor, // 텍스트 색상
                      ),
                      child: const Text(
                        "완료",
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 327,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 198, 195, 195),
                          ),
                          borderRadius: BorderRadius.circular(8)),
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
                          value:
                              _category.isNotEmpty ? _selectedCategory : null,
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
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  TextField(
                    controller: _titleController,
                    autofocus: true,
                    decoration: const InputDecoration(
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
                  TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 80, horizontal: 10),
                      border: OutlineInputBorder(),
                      hintText: "질문을 작성하세요.",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xff979C9E),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
