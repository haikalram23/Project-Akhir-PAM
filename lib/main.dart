import 'package:flutter/material.dart';
import 'package:taskly/pages/home_page.dart';
import 'package:taskly/pages/regist_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/regist': (context) => RegistPage(),
        '/login': (context) => LoginPage(),
        '/home' : (context) => const HomePage(),
      },
    );
  }
}