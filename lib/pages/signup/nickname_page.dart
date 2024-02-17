import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/provider/signup/signup_provider.dart';
import 'package:jeogongtong_front/service/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class NicknamePage extends StatefulWidget {
  const NicknamePage({super.key});
  static const String routeName = '/nickname';
  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final TextEditingController _nicknameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  final String _textFormFieldValue = '';
  late String firebaseUserToken;
  String email = '';

  void _submit() async {
    try {
      final user = context.read<fbAuth.User?>();
      if (user == null) {
        // handle the case where user is null
        return;
      }
      print('nickname: $_textFormFieldValue');
      firebaseUserToken = (await user.getIdToken())!;
      if (!mounted) return;

      await context.read<SignupProvider>().nicknameSignUp(
          nickname: _textFormFieldValue, token: firebaseUserToken);
    } catch (e) {
      print(e.toString());
    }
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
                  textInputAction: TextInputAction.done,
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
                    _submit();
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
