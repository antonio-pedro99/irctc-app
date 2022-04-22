import 'dart:math';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/passenger.dart';
import 'package:irctc_dbms/app/models/search_query.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/pages/home.dart';
import 'package:irctc_dbms/app/views/pages/profile.dart';
import 'package:irctc_dbms/app/views/pages/search/search_result.dart';
import 'package:irctc_dbms/app/views/pages/ticket/tickets.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IRCTC',
      theme: ThemeData(
          backgroundColor: greyBackground,
          textTheme: GoogleFonts.latoTextTheme(),
          primarySwatch: getMaterialColor(swatch)),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _actualPos = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            _actualPos = value;
          },
          controller: _pageController,
          children: [
            SearchResultPage(
              query: Query(
                  to: "Gurugram",
                  from: "New Delhi",
                  departure: "Jan 15, 2022",
                  passengers: [
                    Passenger(),
                    Passenger(),
                    Passenger(),
                    Passenger()
                  ]),
            ),
            TicketPage(),
            ProfilePage()
          ],
        ),
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          elevation: 8,
          currentIndex: _actualPos,
          onTap: (p) {
            setState(() {
              _pageController.jumpToPage(p!);
            });
          },
          hasInk: true,
          hasNotch: true,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          inkColor: swatch,
          items: [
            const BubbleBottomBarItem(
                backgroundColor: swatch,
                icon: Icon(
                  Icons.home,
                  color: grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: swatch,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: swatch,
                icon: Transform.rotate(
                  angle: 0,
                  child: Icon(
                    Icons.receipt,
                    color: Colors.grey[500],
                  ),
                ),
                activeIcon: Transform.rotate(
                  angle: 0,
                  child: const Icon(
                    Icons.receipt,
                    color: swatch,
                  ),
                ),
                title: const Text("Tickets")),
            BubbleBottomBarItem(
                backgroundColor: swatch,
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                ),
                activeIcon: const Icon(
                  Icons.person,
                  color: swatch,
                ),
                title: const Text("My account")),
          ],
        ));
  }
}
