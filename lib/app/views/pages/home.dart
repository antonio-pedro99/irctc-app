// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/controllers/traveller_selecter_controller.dart';
import 'package:irctc_dbms/app/models/scoped/query.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';
import 'package:irctc_dbms/app/models/search_query.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/elements/selecter.dart';
import 'package:irctc_dbms/app/views/pages/search/search_result.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
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

  SelecterTravellerController adultController =
      SelecterTravellerController(selected: 1);
  SelecterTravellerController childrenController =
      SelecterTravellerController();
  SelecterTravellerController minorController = SelecterTravellerController();

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
    travellersController.text = "1 adult.";
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
                height: 225,
                width: 225,
                child: ListView(
                  children: [
                    ChangeNotifierProvider(
                      create: (_) => SelecterTravellerController(
                          selected: adultController.selected),
                      child: SelectTraveller(
                        ageRange: "15 - ahead",
                        title: "Adults",
                        controller: adultController,
                      ),
                    ),
                    ChangeNotifierProvider(
                        create: (_) => SelecterTravellerController(
                            selected: childrenController.selected),
                        child: SelectTraveller(
                          ageRange: "5 - 14 ",
                          title: "Children",
                          controller: childrenController,
                        )),
                    ChangeNotifierProvider(
                        create: (_) => SelecterTravellerController(
                            selected: minorController.selected),
                        child: SelectTraveller(
                          ageRange: "0 - 4",
                          title: "Minor",
                          controller: minorController,
                        )),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        travellersController.text = adultController.text +
                            " adults, " +
                            childrenController.text +
                            " children, " +
                            minorController.text +
                            " minors.";
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text("Done"))
              ],
            );
          });
    });
  }

  void openDatePicker(BuildContext context) {
    setState(() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030))
          .then((value) {
        setState(() {
          departureController.text =
              DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(value!);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    late Query searchQuery;

    return ScopedModelDescendant<UserModel>(builder: ((context, child, model) {
      return Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: primary,
            title: const Text("Search Trips",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
            elevation: 0,
            centerTitle: true,
            expandedHeight: 175,
            flexibleSpace: kToolbarHeight >= 200
                ? Container()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(12, 55, 0, 0),
                    child: ListView(
                      children: [
                        Text(
                            model.isLogged()
                                ? "Hey,  ${UserModel.userData["name"]} Welcome back!"
                                : "Hey, Welcome back!",
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white54)),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Where we will\ngo today?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white))
                      ],
                    ),
                  ),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: primary30),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                const SizedBox(height: 10),
                const Text("Your next trip detail",
                    style: TextStyle(
                        fontSize: 14,
                        color: grey,
                        fontWeight: FontWeight.w600)),
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
                            controller: tabController,
                            children: [
                              oneRouteTrip(
                                  keyOneRoute,
                                  () {
                                    searchQuery = Query(
                                        from: fromController.text,
                                        to: toController.text,
                                        departure: departureController.text,
                                        returnDate: returnController.text,
                                        totalPassengers: int.parse(
                                                adultController.text
                                                    .toString()) +
                                            int.parse(childrenController.text) +
                                            int.parse(minorController.text),
                                        passengers: {
                                          "adults": int.parse(
                                              adultController.text.toString()),
                                          "children": int.parse(
                                              childrenController.text),
                                          "minors":
                                              int.parse(minorController.text),
                                        });
                                    if (keyOneRoute.currentState!.validate()) {
                                      QueryModel.of(context)
                                          .setQuery(searchQuery);

                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const SearchResultPage();
                                      }));
                                    }
                                  },
                                  () {
                                    openDatePicker(context);
                                  },
                                  fromController,
                                  toController,
                                  departureController,
                                  travellersController,
                                  () {
                                    selectTravellers(context);
                                  }),
                              roundTrip(
                                  keyRoundTrip,
                                  () {
                                    searchQuery = Query(
                                        from: fromController.text,
                                        to: toController.text,
                                        departure: departureController.text,
                                        returnDate: returnController.text,
                                        passengers: {
                                          "adults": int.parse(
                                              adultController.text.toString()),
                                          "children": int.parse(
                                              childrenController.text),
                                          "minors":
                                              int.parse(minorController.text)
                                        });
                                    if (keyRoundTrip.currentState!.validate()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const SearchResultPage();
                                      }));
                                    }
                                  },
                                  () {
                                    openDatePicker(context);
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
                          ))
                        ],
                      ),
                    ),
                    MediaQuery.of(context).size.height / 1.6)
              ])))
        ],
      ));
    }));
  }
}

Widget oneRouteTrip(
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
              return null;
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
              return null;
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
              return null;
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
              return null;
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
              onPress: onClickSearch),
        ],
      ));
}

Widget roundTrip(
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
              onPress: onClickSearch),
        ],
      ));
}
