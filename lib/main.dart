import 'package:firebase_chat/auth/login_or_register.dart';
import 'package:firebase_chat/pages/login_page.dart';
import 'package:firebase_chat/pages/register_page.dart';
import 'package:firebase_chat/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      home: AuthPage(),
    );
  }
}
