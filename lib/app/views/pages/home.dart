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
        backgroundColor: Colors.white,
        body: SafeArea(
            minimum: const EdgeInsets.all(18),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.white,
                  title: Text("IRCTC",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: grey1)),
                  centerTitle: true,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarBrightness: Brightness.light,
                      statusBarColor: Colors.white),
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
                    style: TextStyle(
                        color: grey2,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
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
