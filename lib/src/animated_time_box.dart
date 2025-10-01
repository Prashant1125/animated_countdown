import 'package:flutter/material.dart';

class AnimatedTimeBox extends StatelessWidget {
  final int value;
  final Color color;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const AnimatedTimeBox({
    Key? key,
    required this.value,
    required this.color,
    this.textStyle,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      width: width ?? mq.width * .131,
      height: height ?? mq.height * .05,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(mq.width * .02),
      ),
      alignment: Alignment.center,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final inAnimation = Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);

          final outAnimation = Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(1, 0),
          ).animate(animation);

          return ClipRect(
            child: SlideTransition(
              position:
                  child.key == ValueKey(value) ? inAnimation : outAnimation,
              child: child,
            ),
          );
        },
        child: Text(
          value.toString().padLeft(2, '0'),
          key: ValueKey(value),
          style: textStyle ??
              TextStyle(
                fontSize: mq.width * .074,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
