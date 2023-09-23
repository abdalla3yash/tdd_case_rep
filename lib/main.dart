import 'package:flutter/material.dart';
import 'package:poster/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app_name",
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
