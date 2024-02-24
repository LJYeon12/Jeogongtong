import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:jeogongtong_front/constants/api.dart';
import 'package:jeogongtong_front/models/user.dart';

class AuthService {
  final fbAuth.FirebaseAuth firebaseAuth = fbAuth.FirebaseAuth.instance;
  final http.Client httpClient = http.Client();
  //Future<void> setPersistence() async {
  //await firebaseAuth.setPersistence(fbAuth.Persistence.SESSION);
  //}

  Stream<fbAuth.User?> get user => firebaseAuth.userChanges();

  Future<http.Response> signUp(
      {required String nickname, required String token}) async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/login',
    );
    print('AuthService 작동');
    User user = User(nickname: nickname, idToken: token);
    try {
      print('http 시작');
      http.Response response =
          await httpClient.post(uri, body: user.toJson(), headers: {
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ' + token
      });
      print(response.body);

      print("statusCode: ${response.statusCode}");
      print("responseHeaders: ${response.headers}");
      print("responseBody: ${response.body}");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      GoogleSignInAuthentication authentication = await account.authentication;
      fbAuth.OAuthCredential googleCredential =
          fbAuth.GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );
      fbAuth.UserCredential credential =
          await firebaseAuth.signInWithCredential(googleCredential);
      if (credential.user != null) {
        print(credential.user);
      }
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }
}
