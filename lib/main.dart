import 'package:flutter/material.dart';
import 'package:jeogongtong_front/firebase_options.dart';
import 'package:jeogongtong_front/pages/nickname_page.dart';
import 'package:jeogongtong_front/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffF7CCDB))
              .copyWith(background: const Color(0xffF7CCDB)),
        ),
        home: const NicknamePage());
  }
}
