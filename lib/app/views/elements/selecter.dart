import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';

class SelectTraveller extends StatelessWidget {
  const SelectTraveller(
      {Key? key, this.ageRange, this.title, this.selected = 0})
      : super(key: key);

  final String? ageRange;
  final String? title;
  final int? selected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      title: Center(
        child: Text("$selected $title"),
      ),
      subtitle: Center(
        child: Text("($ageRange)"),
      ),
      leading: IconButton(
          color: primary, onPressed: () {}, icon: const Icon(Icons.remove)),
      trailing: IconButton(
          color: primary,
          onPressed: () {},
          icon: const Icon(Icons.add, color: primary)),
    );
  }
}
