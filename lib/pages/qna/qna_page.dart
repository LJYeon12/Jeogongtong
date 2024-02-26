// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/models/post.dart';
import 'package:jeogongtong_front/pages/home/home_search_page.dart';
import 'package:jeogongtong_front/pages/qna/qna_answer_page.dart';
import 'package:jeogongtong_front/pages/qna/qna_search_page.dart';
import 'package:jeogongtong_front/pages/qna/qna_write.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';
import 'package:jeogongtong_front/widgets/question_widget.dart';

class QnAPage extends StatefulWidget {
  const QnAPage({super.key});
  static const routeName = '/qna';
  @override
  State<QnAPage> createState() => _QnAPageState();
}

class _QnAPageState extends State<QnAPage> {
//get
  List<dynamic> _pageContent = [];

  @override
  void initState() {
    super.initState();
    _fetchPageContent();
  }

  Future<void> _fetchPageContent() async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/questions/all',
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        setState(() {
          _pageContent = jsonDecode(utf8.decode(response.bodyBytes));
          print(_pageContent);
        });
      } else {
        print('Failed to load page: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching page: $e');
    }
  }

  final List<String> _tempData = [
    "All",
    "Arts and PE",
    "Civil servant/examination",
    "Economy/Management",
    "Entrance Exam",
    "Employment",
    "IT/Development",
    "Language",
    "Math",
    "Science/Engineering",
    "etc"
  ];
  // Post _sendPost(){

  // }
  @override
  Widget build(BuildContext context) {
    Color _buttonColor1 = const Color(0xff131214);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Q & A",
                style: TextStyle(fontSize: 18),
              ),
            ),
            titleSpacing: 0,
            actions: <Widget>[
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonColor1 = const Color(0xffFC9AB8);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _buttonColor1 = const Color(0xff131214);
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const QnASearchPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  constraints: const BoxConstraints(),
                  child: SvgPicture.asset(
                    "assets/images/search.svg",
                    colorFilter:
                        ColorFilter.mode(_buttonColor1, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              /*
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: _tempData.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text(category)),
                  );
                }).toList()),
              ),
              const SizedBox(
                height: 35,
              ),
              */
              const SizedBox(height: 13),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _pageContent.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(
                      nickname: "${_pageContent[index][3]}",
                      title: "Q. ${_pageContent[index][2]}",
                      comment: "${_pageContent[index][5]}",
                      today: "${_pageContent[index][4]}",
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 24,
            height: 48,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => QnaWritePage()),
                );
              },
              backgroundColor: Color(0xffFC9AB8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0),
              ),
              child: Text(
                'Question',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              elevation: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
