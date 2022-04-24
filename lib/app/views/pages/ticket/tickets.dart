import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/ticket_tile.dart';
import 'package:irctc_dbms/app/views/pages/ticket/ticket_details.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  final Ticket _ticket = Ticket(
      from: "NEW DELHI",
      to: "GOA",
      date: "Jan 15, 2022",
      departureTime: "10:45",
      aririvalTime: "03:00",
      trainId: "103",
      seat: 200,
      tripId: "23423",
      price: 100);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: ((context, child, model) {
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
              child: ListView(
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
                  ),
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
                          price: 100)),
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
                          price: 100)),
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
                          price: 100)),
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
                          price: 100)),
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
                          price: 100)),
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
                          price: 100)),
                ],
              )));
    }));
  }
}
