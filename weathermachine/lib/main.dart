import 'package:flutter/material.dart';
import 'package:weathermachine/app/pages/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeView(),
        ),
      ),
    );
  }
}
