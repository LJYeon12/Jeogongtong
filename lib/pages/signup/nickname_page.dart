// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/constants/api.dart';
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

  String _textFormFieldValue = '';
  late String firebaseUserToken;
  String email = '';
  String nickname = '';

  Future<void> _submit() async {
    try {
      final user = context.read<fbAuth.User?>();
      if (user == null) {
        // handle the case where user is null
        return;
      }
      _textFormFieldValue = _nicknameController.text;
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
                "Welcome!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter your nickname.",
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
                    labelText: 'Nickname..',
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
                _submit();
              },
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              elevation: 2.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
