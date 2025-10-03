import 'dart:async';
import 'package:flutter/material.dart';
import 'animated_time_box.dart';

class AnimationCountdown extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onFinish;
  final Color minuteBoxColor;
  final Color secondBoxColor;
  final TextStyle? textStyle;
  final TextStyle? colonTextStyle;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const AnimationCountdown(
      {Key? key,
      required this.duration,
      this.onFinish,
      this.minuteBoxColor = Colors.green,
      this.secondBoxColor = Colors.green,
      this.textStyle,
      this.width,
      this.height,
      this.borderRadius,
      this.colonTextStyle
})
      : super(key: key);

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
