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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                AnimationCountdown(
                  duration: const Duration(minutes: 5, seconds: 30),
                  spacing: 5,
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

                AnimationCountdown(
                  duration: const Duration(minutes: 1, seconds: 10),
                  width: 60,
                  height: 60,
                  spacing: 5,
                  borderRadius: BorderRadius.circular(100),
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  minuteBoxColor: Colors.teal,
                  secondBoxColor: Colors.red,
                  onFinish: () {
                    debugPrint("⏱️ Timer Finished!");
                  },
                ),

                AnimationCountdown(
                  duration: const Duration(minutes: 10, seconds: 30),
                  width: 60,
                  height: 60,
                  spacing: 5,
                  colonTextStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  minuteBoxColor: Colors.grey,
                  secondBoxColor: Colors.grey,
                  onFinish: () {
                    debugPrint("⏱️ Timer Finished!");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
