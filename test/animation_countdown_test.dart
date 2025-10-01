import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animation_countdown/animation_countdown.dart';

void main() {
  testWidgets('AnimationCountdown renders properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AnimationCountdown(
            duration: Duration(seconds: 5),
          ),
        ),
      ),
    );

    // check that timer text appears
    expect(find.text('05'), findsOneWidget); // seconds value padded
  });
}
