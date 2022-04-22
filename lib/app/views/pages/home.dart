import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/box_rectangle.dart';
import 'package:irctc_dbms/app/views/elements/ticket_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            /*  title: const Text("Search Trips",
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20, color: grey)), */

            floating: true,
            snap: true,
            pinned: true,
            elevation: 0,
            expandedHeight: 175,
            flexibleSpace: kToolbarHeight >= 200
                ? Container()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Welcome back!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: grey)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Where we will\ngo today?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: swatch))
                      ],
                    ),
                  ),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.white),
            actions: []),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              const Text("Your recent Trip",
                  style: TextStyle(
                      fontSize: 14, color: grey, fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              TicketTile(
                ticket: Ticket(
                    from: "NEW DELHI",
                    to: "GOA",
                    date: "Jan 15, 2022",
                    departureTime: "10:45",
                    aririvalTime: "03:00",
                    trainId: "103",
                    seat: 200,
                    tripId: "23423",
                    price: 100),
              ),
              const SizedBox(height: 5),
              const Text("Your next trip details",
                  style: TextStyle(
                      fontSize: 14, color: grey, fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              BoxRectangle(
                height: MediaQuery.of(context).size.height / 2.7,
                body: Column(),
              )
            ])))
      ],
    ));
  }
}
