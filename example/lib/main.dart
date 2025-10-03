import 'package:flutter/material.dart';
import 'package:animation_countdown/animation_countdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Countdown Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("Animation Countdown Demo")),
        body: Center(
          child: AnimationCountdown(
            duration: const Duration(minutes: 5, seconds: 30),
            colonTextStyle: const TextStyle(fontSize: 30, color: Colors.green),
            width: 60,
            height: 60,
            borderRadius: BorderRadius.circular(10),
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            minuteBoxColor: Colors.green,
            secondBoxColor: Colors.green,
            onFinish: () {
              debugPrint("⏱️ Timer Finished!");
            },
          ),
        ),
      ),
    );
  }
}
