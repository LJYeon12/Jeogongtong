import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/provider/auth/auth_state.dart';
import 'package:jeogongtong_front/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              title: const Text('알고리즘'),
              trailing: const Icon(Icons.play_arrow_outlined),
            );
          },
          itemCount: 3,
        ),
      ),
    ));
  }
}
