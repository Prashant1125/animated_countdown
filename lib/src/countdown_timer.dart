import 'dart:async';
import 'package:flutter/material.dart';
import 'animated_time_box.dart';

/// A customizable animated countdown widget.
///
/// This widget displays a countdown timer in minutes and seconds.
/// Each time unit is shown inside an animated box that updates
/// smoothly as the countdown decreases.
///
/// You can customize the colors, text styles, sizes, and shapes
/// of the countdown boxes. An optional [onFinish] callback is
/// triggered when the countdown reaches zero.
class AnimationCountdown extends StatefulWidget {
  /// The total duration for the countdown.
  final Duration duration;

  /// A callback that is executed when the countdown finishes.
  final VoidCallback? onFinish;

  /// The background color of the minute box.
  final Color minuteBoxColor;

  /// The background color of the second box.
  final Color secondBoxColor;

  /// The text style used for the numbers (minutes and seconds).
  final TextStyle? textStyle;

  /// The text style used for the colon (:) separator.
  final TextStyle? colonTextStyle;

  /// The width of each time box.
  final double? width;

  /// The height of each time box.
  final double? height;

  /// The border radius of the time boxes.
  final BorderRadius? borderRadius;

  /// Creates a new [AnimationCountdown].
  ///
  /// The [duration] parameter is required and must be greater than zero.
  const AnimationCountdown({
    super.key,
    required this.duration,
    this.onFinish,
    this.minuteBoxColor = Colors.green,
    this.secondBoxColor = Colors.green,
    this.textStyle,
    this.width,
    this.height,
    this.borderRadius,
    this.colonTextStyle,
  });

  @override
  State<AnimationCountdown> createState() => _AnimationCountdownState();
}

class _AnimationCountdownState extends State<AnimationCountdown> {
  late int minutes;
  late int seconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    minutes = widget.duration.inMinutes;
    seconds = widget.duration.inSeconds % 60;
    startTimer();
  }

  /// Starts the countdown timer.
  ///
  /// Updates the UI every second and calls [widget.onFinish]
  /// when the countdown reaches zero.
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minutes == 0 && seconds == 0) {
        _timer?.cancel();
        if (widget.onFinish != null) widget.onFinish!();
      } else {
        setState(() {
          if (seconds == 0) {
            minutes--;
            seconds = 59;
          } else {
            seconds--;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Row(
      children: [
        AnimatedTimeBox(
          value: minutes,
          color: widget.minuteBoxColor,
          textStyle: widget.textStyle,
          width: widget.width,
          height: widget.height,
          borderRadius: widget.borderRadius,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .01),
          child: Text(
            ":",
            style: widget.colonTextStyle ??
                TextStyle(
                  fontSize: mq.width * .075,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        AnimatedTimeBox(
          value: seconds,
          color: widget.secondBoxColor,
          textStyle: widget.textStyle,
          width: widget.width,
          height: widget.height,
          borderRadius: widget.borderRadius,
        ),
      ],
    );
  }
}
