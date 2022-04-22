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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Search Trip",
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey)),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.white),
          actions: [],
        ),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            const SliverAppBar(),
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
                "Recente Trips",
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
