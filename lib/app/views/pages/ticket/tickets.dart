import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/ticket_tile.dart';
import 'package:irctc_dbms/app/views/pages/ticket/ticket_details.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final Ticket _ticket = Ticket(
      from: "NEW DELHI",
      to: "GOA",
      date: "Jan 15, 2022",
      departureTime: "10:45",
      aririvalTime: "03:00",
      trainId: "1034304",
      seat: 200,
      tripId: "23423",
      price: 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primary,
            title: const Text("Tickets",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                )),
            centerTitle: true,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: primary30),
            actions: []),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: TicketTile(
                    ticket: _ticket,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TicketDetailPage(
                        ticket: _ticket,
                      );
                    }));
                  },
                )
              ],
            )));
  }
}
