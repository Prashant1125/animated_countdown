# Animation Countdown ⏱️

![Pub Version](https://img.shields.io/pub/v/animation_countdown?color=blue&label=pub%20version)
![Likes](https://img.shields.io/pub/likes/animation_countdown?color=yellow)
![Popularity](https://img.shields.io/pub/popularity/animation_countdown?color=green)

✨ **Animation Countdown** is a lightweight and customizable Flutter package that provides a sleek, animated countdown timer.  
Easily integrate into any Flutter project — works without any dependency on state management solutions like GetX, Provider, or BLoC.

## Demo

![Demo](https://raw.githubusercontent.com/Prashant1125/animated_countdown/main/show_timer.gif)

---

## Installation

Add this to your package’s `pubspec.yaml` file:

```yaml
dependencies:
  animation_countdown: ^0.1.4
```

Then

```
flutter pub get
```

## Example

```
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
```

This project is a starting point for a Flutter application.

## Features

- Fully customizable countdown timer
- Smooth animated number transitions
- Adjustable size, spacing, colors, text style, and border radius
- Works with plain `setState` (no state management required)
- Callback when timer finishes

Pub.dev package link : https://pub.dev/packages/animation_countdown

## Thank you
