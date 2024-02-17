import 'package:flutter/material.dart';
import 'package:jeogongtong_front/pages/nickname_page.dart';
import 'package:jeogongtong_front/pages/signup_page.dart';
import 'package:jeogongtong_front/pages/study/study_page.dart';
import 'package:jeogongtong_front/provider/auth/auth_state.dart';
import 'package:jeogongtong_front/provider/signup/signup_state.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthState>();
    final nicknameState = context.watch<SignupState>();

    if (nicknameState.signupStatus == SignupStatus.beforeNickname) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, NicknamePage.routeName);
      });
    } else if (authState.authStatus == AuthStatus.authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        //TODO Home Page로 변환
        Navigator.pushNamed(context, StudyPage.routeName);
      });
    } else if (authState.authStatus == AuthStatus.unauthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, SignUpPage.routeName);
      });
    }

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
