import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/pages/study/study_detail_page.dart';
import 'package:jeogongtong_front/provider/auth/auth_state.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

final user = FirebaseAuth.instance.currentUser;
//Get
Future<Map<String, dynamic>> study() async {
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
  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> studyroom = jsonDecode(responseBody);
    Map<String, dynamic> mu = studyroom['user'];
    final n = studyroom['myStudy'];
    int userId = mu['userId'];
    final name = [];
    final studyId = [];
    for (var index in n) {
      name.add(index['name']);
      studyId.add(index['studyId']);
    }
    print(studyId);
    Map<String, dynamic> result = {
      "userId": userId,
      "studyName": name,
      "studyId": studyId,
    };
    return result;
  } else {
    throw Exception('Failed!');
  }
}

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});
  static const String routeName = '/study';
  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
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
                "공부하기",
                style: TextStyle(fontSize: 18),
              ),
            ),
            titleSpacing: 0,
          ),
        ),
        body: FutureBuilder(
          future: study(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Center(
                  child: Text(
                    '스터디방을 불러오던 중 오류가 났습니다.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            } else if ((snapshot.data)!.isEmpty) {
              return const Center(
                child: Text(
                  '현재 참여한 스터디방이 없습니다.',
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              Map<String, dynamic> hi = snapshot.data!;
              List<dynamic> room = hi['studyName'];
              int id = hi['userId'];
              List<dynamic> sid = hi['studyId'];
              return Column(
                children: [
                  const SizedBox(height: 13),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: room.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          title: Text(
                            room[index].toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: SvgPicture.asset('assets/images/play.svg'),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudyDetailPage(
                                userId: id,
                                studyId: sid[index],
                                name: room[index],
                              ),
                            ));
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
