import 'package:flutter/material.dart';
import 'package:poster/bloc.dart';
import 'package:poster/core/app_theme.dart';
import 'injection_dep.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GenerateMultiBloc(
      child: MaterialApp(
        title: "app_name",
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(),
      ),
    );
  }
}
