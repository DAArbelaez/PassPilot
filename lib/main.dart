import 'package:flutter/material.dart';
import 'package:passpilot/features/home/view/home_view.dart';
import 'package:passpilot/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'Flutter Demo',
      home: const HomeView(),
    );
  }
}
