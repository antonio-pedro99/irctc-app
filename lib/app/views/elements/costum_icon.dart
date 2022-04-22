import 'package:flutter/material.dart';

class CostumIcon extends StatelessWidget {
  const CostumIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:const [
        Icon(Icons.wb_sunny_outlined),
        Icon(Icons.cloud_sharp, size: 10,)
      ],
    );
  }
}
