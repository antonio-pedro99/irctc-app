import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.label,
      this.labelColor = Colors.black54,
      required this.onPress,
      this.height = 52,
      this.width = 227})
      : super(key: key);

  final double? height;
  final double? width;
  final Color labelColor;
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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
