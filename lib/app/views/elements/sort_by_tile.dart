import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';

class SortByTile extends StatelessWidget {
  const SortByTile({Key? key, this.isSelected, this.label, this.onTap})
      : super(key: key);

  final bool? isSelected;
  final String? label;
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
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
            color: isSelected! ? primary : primary30,
            borderRadius: BorderRadius.circular(13)),
        child: DefaultTextStyle(
          style: TextStyle(
              fontWeight: isSelected! ? FontWeight.bold : FontWeight.normal,
              color: isSelected! ? Colors.white : swatch,
              fontSize: 16),
          child: Center(
              child: Text(
            label!,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
