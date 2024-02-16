import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeogongtong_front/constants/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signInWithGoogle(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      GoogleSignInAuthentication authentication = await account.authentication;
      OAuthCredential googleCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );
      UserCredential credential =
          await _firebaseAuth.signInWithCredential(googleCredential);
      if (credential.user != null) {
        print(credential.user);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "공부의 저금고,",
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "저공통",
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Flexible(
                child: SvgPicture.asset(
                  "assets/images/app_icon.svg",
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // 패딩 제거
              ),
              child: SvgPicture.asset(
                "assets/images/google_login.svg",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: SvgPicture.asset(
                "assets/images/kakao_login.svg",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
