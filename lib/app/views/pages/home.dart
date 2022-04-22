import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: primary,
          title: Text("Search Trip",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              )),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              statusBarColor: primary30),
          actions: [],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Destaques",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [],
          ),
          const SizedBox(height: 10),
        ]))
      ],
    )));
  }
}
