// 📁 lib/main.dart
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/admin_page.dart';
import 'pages/home_page.dart'; // ta page de livreur

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/admin': (context) => const AdminPage(),
      },
    );
  }
}