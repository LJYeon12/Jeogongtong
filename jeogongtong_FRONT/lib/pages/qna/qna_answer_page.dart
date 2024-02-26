import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/widgets/answer_widget.dart';
import 'package:jeogongtong_front/widgets/textfield_widget.dart';

class QnAAnswerPage extends StatefulWidget {
  const QnAAnswerPage({super.key});

  @override
  State<QnAAnswerPage> createState() => _QnAAnswerPageState();
}

class _QnAAnswerPageState extends State<QnAAnswerPage> {
  final TextEditingController _textController = TextEditingController();
  Color _buttonColor1 = const Color(0xff131214);
  List<String> _comments = [];
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
              "Q & A",
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
        body: Column(
          children: [
            Answerpaper(
                content:
                    "[backend] Spring dependency error invoked like this.\n Plz help me.",
                title: "Q. Do you know why the dependency error is doing this?",
                category: "IT/Development",
                user: "김나연"),
            Divider(
              indent: 0,
              thickness: 15,
              color: Color(0xffF2F4F5),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                children: [
                  Text(
                    "Answer",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_comments[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Answer the question',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        setState(() {
                          _comments.add(_textController.text);
                          _textController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
