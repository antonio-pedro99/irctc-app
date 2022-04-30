import 'package:flutter/material.dart';

import '../../constants.dart';

class BoxRectangle extends StatelessWidget {
  const BoxRectangle({Key? key, this.title, this.body, this.height, this.color})
      : super(key: key);

  final String? title;
  final double? height;
  final Widget? body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Card(
      borderOnForeground: false,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: height,
        width: media.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(13)),
        child: DefaultTextStyle(
            style: const TextStyle(color: grey, fontWeight: FontWeight.w100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title == null
                    ? Text(
                        title!,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                body!
              ],
            )),
      ),
    );
  }
}
