import 'package:flutter/material.dart';

class TrainCircle extends StatelessWidget {
  const TrainCircle({Key? key, this.background, this.iconColor, this.radius})
      : super(key: key);

  final Color? background;
  final Color? iconColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: background,
      child: Icon(
        Icons.train_sharp,
        color: iconColor,
        size: radius!,
      ),
      radius: radius,
    );
  }
}
