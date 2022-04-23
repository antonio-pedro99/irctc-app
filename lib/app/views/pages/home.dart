// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/elements/selecter.dart';
import 'package:irctc_dbms/app/views/elements/ticket_tile.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final keyOneRoute = GlobalKey<FormState>();
  final keyRoundTrip = GlobalKey<FormState>();

  late TabController tabController;

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController departureController = TextEditingController();
  TextEditingController travellersController = TextEditingController();
  TextEditingController returnController = TextEditingController();

  List<Tab> tabs = const [
    Tab(
      text: "One route",
    ),
    Tab(
      text: "Round trip",
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    departureController.text =
        DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
            .format(DateTime.now());
    returnController.text = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
        .format(DateTime(DateTime.tuesday));
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget customContainer(BuildContext context, Widget body, double height) {
    var media = MediaQuery.of(context).size;
    return Card(
      borderOnForeground: false,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: height,
        width: media.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: DefaultTextStyle(
          style: const TextStyle(color: grey, fontWeight: FontWeight.w100),
          child: body,
        ),
      ),
    );
  }

  selectTravellers(BuildContext context) {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView(
                  children: const [
                    SelectTraveller(
                      ageRange: "15 - ahead",
                      title: "Adults",
                      selected: 0,
                    ),
                    SelectTraveller(
                      ageRange: "5 - 14 ",
                      title: "Children",
                      selected: 0,
                    ),
                    SelectTraveller(
                      ageRange: "0 - 4",
                      title: "Minor",
                      selected: 0,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () {}, child: const Text("Done"))
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text("Search Trips",
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 20, color: grey)),
          floating: true,
          elevation: 0,
          centerTitle: true,
          expandedHeight: 175,
          flexibleSpace: kToolbarHeight >= 200
              ? Container()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(12, 55, 0, 0),
                  child: ListView(
                    children: const [
                      Text("Welcome back!",
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.visible,
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
        ),
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
              customContainer(
                  context,
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                            controller: tabController,
                            labelColor: swatch,
                            unselectedLabelColor: grey,
                            labelStyle: const TextStyle(fontSize: 16),
                            indicatorColor: swatch,
                            indicator: MaterialIndicator(
                              height: 2,
                              strokeWidth: 10,
                              topLeftRadius: 8,
                              topRightRadius: 8,
                              bottomLeftRadius: 8,
                              bottomRightRadius: 8,
                              horizontalPadding: 50,
                              color: swatch,
                            ),
                            tabs: tabs),
                        Expanded(
                            child: TabBarView(
                          children: [
                            one_route(
                                keyOneRoute,
                                () {},
                                () {
                                  setState(() {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2030))
                                        .then((value) {
                                      setState(() {
                                        departureController
                                            .text = DateFormat(DateFormat
                                                .YEAR_ABBR_MONTH_WEEKDAY_DAY)
                                            .format(value!);
                                      });
                                    });
                                  });
                                },
                                fromController,
                                toController,
                                departureController,
                                travellersController,
                                () {
                                  selectTravellers(context);
                                }),
                            round_trip(
                                keyRoundTrip,
                                () {},
                                () {
                                  setState(() {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2030))
                                        .then((value) {
                                      setState(() {
                                        departureController
                                            .text = DateFormat(DateFormat
                                                .YEAR_ABBR_MONTH_WEEKDAY_DAY)
                                            .format(value!);
                                      });
                                    });
                                  });
                                },
                                fromController,
                                toController,
                                departureController,
                                travellersController,
                                returnController,
                                () {
                                  selectTravellers(context);
                                })
                          ],
                          controller: tabController,
                        ))
                      ],
                    ),
                  ),
                  MediaQuery.of(context).size.height / 1.6)
            ])))
      ],
    ));
  }
}

Widget one_route(
    GlobalKey<FormState> formKey,
    VoidCallback onClickSearch,
    VoidCallback onDateClick,
    TextEditingController from,
    TextEditingController to,
    TextEditingController departure,
    TextEditingController travellers,
    VoidCallback onClickTravellers) {
  return Form(
      key: formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: from,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "From",
                prefixIcon:
                    const Icon(Icons.flight_takeoff_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("From"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: to,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "To",
                prefixIcon: const Icon(Icons.flight_land_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("To"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: departure,
            onTap: onDateClick,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "Departure",
                prefixIcon: const Icon(Icons.date_range_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("Departure"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: travellers,
            onTap: onClickTravellers,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "Travellers",
                prefixIcon: const Icon(Icons.people_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("Travellers"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 25),
          RoundedButton(
              label: "Search",
              labelColor: Colors.white,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  onClickSearch;
                }
              }),
        ],
      ));
}

Widget round_trip(
    GlobalKey<FormState> formKey,
    VoidCallback onClickSearch,
    VoidCallback onDateClick,
    TextEditingController from,
    TextEditingController to,
    TextEditingController departure,
    TextEditingController travellers,
    TextEditingController returnController,
    VoidCallback onClickTravellers) {
  return Form(
      key: formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: from,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "From",
                prefixIcon:
                    const Icon(Icons.flight_takeoff_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("From"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: to,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "To",
                prefixIcon: const Icon(Icons.flight_land_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("To"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: departure,
            onTap: onDateClick,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "Departure",
                prefixIcon: const Icon(Icons.date_range_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("Departure"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: returnController,
            onTap: onDateClick,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "Return",
                prefixIcon: const Icon(Icons.date_range_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("Return"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: travellers,
            onTap: onClickTravellers,
            validator: (str) {
              if (str!.isEmpty) {
                return "Please Enter a valid argument";
              }
              return "";
            },
            decoration: InputDecoration(
                hintText: "Travellers",
                prefixIcon: const Icon(Icons.people_sharp, color: primary),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: const Text("Travellers"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: grey1, width: 0.2),
                    borderRadius: BorderRadius.circular(13))),
          ),
          const SizedBox(height: 25),
          RoundedButton(
              label: "Search",
              labelColor: Colors.white,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  onClickSearch;
                }
              }),
        ],
      ));
}
