import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jeogongtong_front/constants/colors.dart';

class NicknamePage extends StatefulWidget {
  const NicknamePage({super.key});

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final TextEditingController _nicknameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String _textFormFieldValue = '';

  void _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();

    print('nickname : $form');
    // try {
    //   await context
    //       .read<SigninProvider>()
    //       .signin(email: _email!, password: _password!);
    // } on CustomError catch (e) {
    //   errorDialog(context, e);
    // }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 49),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "환영합니다!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                "닉네임을 입력하세요.",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              /**
               * <닉네임 유효성 검사>
               * 영어 대/소문자, 한글, 숫자
               * 최대 10글자
               */
              Form(
                key: _formKey,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[a-zA-Zㄱ-ㅎ가-힣0-9]'),
                    ),
                  ],
                  controller: _nicknameController,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: false,
                    labelText: '닉네임',
                  ),
                  onSaved: (value) {
                    setState(() {
                      _textFormFieldValue = value!;
                      print("닉네임 : $_textFormFieldValue");
                    });
                  },
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (String nickname) {
                    print('닉네임 : $nickname');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '1자 이상 입력해주세요.';
                    } else if (value.length > 10) {
                      return '10자 이하로 입력해주세요.';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 327,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final formKeyState = _formKey.currentState!;
                    if (formKeyState.validate()) {
                      formKeyState.save();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: buttonColor, // 텍스트 색상
                  ),
                  child: const Text("확인"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
