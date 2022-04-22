import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';

class TimeTile extends StatelessWidget {
  const TimeTile(
      {Key? key,
      this.icon,
      this.period,
      this.timeRange,
      this.isSelected,
      this.onTap})
      : super(key: key);

  final IconData? icon;
  final String? period;
  final String? timeRange;
  final bool? isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 60,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            color: isSelected! ? primary : primary30,
            borderRadius: BorderRadius.circular(13)),
        child: DefaultTextStyle(
            style: TextStyle(
                color: isSelected! ? Colors.white : swatch,
                fontWeight: FontWeight.w100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: isSelected! ? Colors.white : swatch,
                  size: 24,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      period!,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(timeRange!)
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
