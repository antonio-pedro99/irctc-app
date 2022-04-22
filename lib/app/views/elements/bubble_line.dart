import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';

class BubbleLine extends StatelessWidget {
  const BubbleLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 0.3,
          color: primary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Container(
              height: 3,
              width: 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: swatch),
            ),
            Container(
              height: 3,
              width: 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: swatch),
            ),
            Container(
              height: 3,
              width: 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: swatch),
            ) */
          ],
        )
      ],
    );
  }
}
