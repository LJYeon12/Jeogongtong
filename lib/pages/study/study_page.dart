import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/pages/study/study_detail_page.dart';
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
  List<String> nameExample = ["알고리즘", "Java", "토익 700점 목표"];
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
        body: Column(
          children: [
            const SizedBox(height: 13),
            Expanded(
              child: ListView.builder(
                itemCount: nameExample.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text(
                      nameExample[index],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StudyDetailPage()));
                    },
                    trailing: SvgPicture.asset("assets/images/play.svg"),
                  );
                },
              ),
              /*
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        names[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        int selectedStudyId = studyIds[index];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                RoomPage(studyId: selectedStudyId)));
                      });
                },
              ),
              */
            )
          ],
        ),
        /*
      Padding(
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
      */
      ),
    );
  }
}
