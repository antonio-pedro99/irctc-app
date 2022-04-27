import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/controllers/login_control.dart';
import 'package:irctc_dbms/app/models/scoped/query.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';

import 'package:irctc_dbms/app/views/pages/home.dart';
import 'package:irctc_dbms/app/views/pages/login/on_boarding.dart';
import 'package:irctc_dbms/app/views/pages/notifications.dart';
import 'package:irctc_dbms/app/views/pages/profile.dart';

import 'package:irctc_dbms/app/views/pages/ticket/tickets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return ScopedModel<QueryModel>(
              model: QueryModel(userModel: model),
              child: ScopedModelDescendant<QueryModel>(
                  builder: ((context, child, model) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'IRCTC',
                  theme: ThemeData(
                      backgroundColor: greyBackground,
                      textTheme: GoogleFonts.latoTextTheme(),
                      primarySwatch: getMaterialColor(swatch)),
                  home: const OnBoardingPage(),
                );
              })));
        }));
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
            const HomePage(),
            TicketPage(),
            const NotificationsPage(),
            const ProfilePage()
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
                icon: Transform.rotate(
                  angle: 0,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.grey[500],
                  ),
                ),
                activeIcon: Transform.rotate(
                  angle: 0,
                  child: const Icon(
                    Icons.notifications,
                    color: swatch,
                  ),
                ),
                title: const Text("Notifications")),
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
