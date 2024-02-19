import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:jeogongtong_front/constants/colors.dart';
import 'package:jeogongtong_front/pages/home/home_page.dart';
//import 'package:jeogongtong_front/firebase_options.dart';
import 'package:jeogongtong_front/pages/splash_page.dart';
import 'package:jeogongtong_front/pages/study/study_page.dart';
import 'package:jeogongtong_front/provider/auth/auth_provider.dart';
import 'package:jeogongtong_front/provider/auth/auth_state.dart';
import 'package:jeogongtong_front/provider/signup/signup_provider.dart';
import 'package:jeogongtong_front/provider/signup/signup_state.dart';
import 'package:jeogongtong_front/service/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (context) {
          return AuthService();
        }),
        StreamProvider<fbAuth.User?>(
            create: (context) => context.read<AuthService>().user,
            initialData: null),
        StateNotifierProvider<AuthProvider, AuthState>(
            create: (context) => AuthProvider()),
        StateNotifierProvider<SignupProvider, SignupState>(
            create: (context) => SignupProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xffF7CCDB))
                    .copyWith(background: Colors.white),
          ),
          home: const QnAPage(),
          routes: {
            SignUpPage.routeName: (context) => const SignUpPage(),
            StudyPage.routeName: (context) => const StudyPage(),
            NicknamePage.routeName: (context) => const NicknamePage()
          }),
    );
  }
}
*/
