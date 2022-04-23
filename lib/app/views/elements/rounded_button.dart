import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.label,
      this.labelColor = Colors.black54,
      required this.onPress,
      this.height = 52,
      this.color,
      this.width})
      : super(key: key);

  final double? height;
  final double? width;
  final Color labelColor;
  final String label;
  final VoidCallback onPress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width ?? 227,
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          label,
          style: TextStyle(
              color: labelColor, fontSize: 20, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
