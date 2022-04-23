import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/controllers/traveller_selecter_controller.dart';
import 'package:provider/provider.dart';

class SelectTraveller extends StatelessWidget {
  const SelectTraveller(
      {Key? key, required this.controller, this.ageRange, this.title})
      : super(key: key);

  final String? ageRange;
  final String? title;

  final SelecterTravellerController controller;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      title: Center(
        child: Text(
            "${Provider.of<SelecterTravellerController>(context).selected} $title"),
      ),
      subtitle: Center(
        child: Text("($ageRange)"),
      ),
      leading: IconButton(
          color: primary,
          onPressed: () {
            controller.decrement();
          },
          icon: const Icon(Icons.remove)),
      trailing: IconButton(
          color: primary,
          onPressed: () {
            controller.increment();
          },
          icon: const Icon(Icons.add, color: primary)),
    );
  }
}
