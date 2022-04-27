import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/services/user.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/elements/ticket_tile.dart';
import 'package:irctc_dbms/app/views/pages/login/login.dart';
import 'package:irctc_dbms/app/views/pages/ticket/ticket_details.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  /* final Ticket _ticket = Ticket(
      location: "NEW DELHI",
      destination: "GOA",
      departure: "Jan 15, 2022",
      departureTime: "10:45",
      aririvalTime: "03:00",
      trainId: 1054,
      seat: 200,
      tripId: 23423,

      price: 100); */

  //final Ticket _ticket = Ticket(); //null

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
              //to be changed
              child: model.isLogged()
                  ? FutureBuilder<List<Ticket>>(
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: Text(
                                  "Unabled to fetch data, check your internet"));
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              child: TicketTile(
                                ticket: snapshot.data![index],
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TicketDetailPage(
                                    ticket: snapshot.data![index],
                                  );
                                }));
                              },
                            );
                          }),
                        );
                      },
                      future: UserDataProvider.fetchticket(UserModel.logged!),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "You need to make login",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(height: 24),
                          RoundedButton(
                              label: "Login now",
                              labelColor: Colors.white,
                              onPress: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const LoginPage();
                                }));
                              })
                        ],
                      ),
                    )));
    }));
  }
}
