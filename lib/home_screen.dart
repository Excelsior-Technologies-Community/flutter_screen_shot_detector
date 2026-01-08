import 'package:flutter/material.dart';
import 'widgets/screen_protector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenProtector(
        child: Center(child: Text('Hello'),),
      ),
    );
  }
}
