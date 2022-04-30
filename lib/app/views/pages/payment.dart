import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/ticket.dart';

import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/services/user.dart';
import 'package:irctc_dbms/app/views/elements/box_rectangle.dart';
import 'package:irctc_dbms/app/views/pages/login/login.dart';
import 'package:irctc_dbms/app/views/pages/ticket/ticket_details.dart';
import 'package:irctc_dbms/app/views/pages/ticket/tickets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, this.trip}) : super(key: key);

  final Trip? trip;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = const [
    Tab(
      text: "Credit/Debit Card",
    ),
    Tab(
      text: "Wallet",
    ),
    Tab(
      text: "Internt Banking",
    )
  ];

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          title: const Text(
            "Payment ",
            style: TextStyle(fontSize: 24),
          ),
          /* const SizedBox(
                height: 25,
              ),
              const Text(
                "Total to be paid",
              ),
              Text("Rs ${widget.trip!.price}",
                  style: const TextStyle(fontSize: 18))
            ], */

          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: primary30),
        ),
        body:
            ScopedModelDescendant<UserModel>(builder: ((context, child, model) {
          return DefaultTabController(
              length: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBar(
                        controller: tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: grey,
                        labelStyle: const TextStyle(fontSize: 16),
                        //indicatorColor: Colors.white,
                        indicator: RectangularIndicator(
                            bottomLeftRadius: 13,
                            bottomRightRadius: 13,
                            topLeftRadius: 13,
                            topRightRadius: 13,
                            color: swatch),
                        tabs: tabs),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        children: [
                          cardPaymentMethod(context),
                          Container(color: Colors.yellow),
                          Container(color: Colors.orange),
                        ],
                        controller: tabController,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            maximumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size(200, 50)),
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size(170, 50)),
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => primary)),
                        onPressed: () async {
                          if (model.isLogged()) {
                            Map<String, dynamic> paym = {
                              "payment_method": 2,
                              "amount": 1500
                            };

                            Map<String, dynamic> payment = {
                              "payment_method": tabController.index + 1,
                              "amount": widget.trip!.price,
                            };

                            var paymentDetails =
                                await FakeRazorPayApi.paymentGateway(paym);

                            var selection = {
                              "trip_id": widget.trip!.tripId,
                              "passenger_id": UserModel.logged,
                              "payment_id": paymentDetails["paymentID"]
                            };
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Success",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      content: Container(
                                        height: 75,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        alignment: Alignment.center,
                                        child: const Text(
                                            "Ticket has been booked successfully."),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return TicketPage();
                                            }));
                                          },
                                          child: const Text("See Details"),
                                        )
                                      ],
                                    );
                                  });
                            });
                            await UserDataProvider.bookTicket(selection);
                          } else {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Alert",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      content: Container(
                                        height: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        alignment: Alignment.center,
                                        child: const Text(
                                            "You are not logged in, login in first"),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const LoginPage();
                                            }));
                                          },
                                          child: const Text("Please login"),
                                        )
                                      ],
                                    );
                                  });
                            });
                          }
                        },
                        child: const Text("Pay now",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))),
                  ],
                ),
              ));
        })));
  }

  Widget cardPaymentMethod(BuildContext context) {
    var _key = GlobalKey<FormState>();
    return BoxRectangle(
        title: "",
        height: MediaQuery.of(context).size.height / 5,
        body: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  /*   controller: to, */
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "Please Enter a valid argument";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Name on Card",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: const Text("Name on Card"),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: grey1, width: 0.2),
                          borderRadius: BorderRadius.circular(13))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "Please Enter a valid argument";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Card Number",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: const Text("Card Number"),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: grey1, width: 0.2),
                          borderRadius: BorderRadius.circular(13))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "Please Enter a valid argument";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Expiration",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: const Text("Expiration"),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: grey1, width: 0.2),
                          borderRadius: BorderRadius.circular(13))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  /*   controller: travellers,
                  onTap: onClickTravellers, */
                  validator: (str) {
                    if (str!.isEmpty) {
                      return "Please Enter a valid argument";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "CVC",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: const Text("CVC"),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: grey1, width: 0.2),
                          borderRadius: BorderRadius.circular(13))),
                ),
              ],
            )));
  }
}
