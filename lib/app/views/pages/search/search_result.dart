import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/search_query.dart';
import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/views/elements/trip_tile.dart';
import 'package:irctc_dbms/app/views/pages/search/filter_page.dart';
import 'package:irctc_dbms/app/views/pages/search/trip_detail.dart';

bool filterApplied = false;

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key, this.query}) : super(key: key);

  final Query? query;
  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final _trip = Trip(
    from: "New Delhi",
    fromCode: "DLX",
    to: "Gugugram",
    toCode: "GGM",
    stationLocation: "Govind Puri Train Station",
    departureTime: "00:30",
    arrivalTime: "2:00 AM",
    price: 200,
    trainId: 234,
    duration: "01h20m",
    stops: [
      /*  Trip(
        from: "Mumbai",
        fromCode: "MBI",
        to: "Gugugram",
        toCode: "GGM",
        stationLocation: "Mumbai Train Station",
        departureTime: "01:30",
        arrivalTime: "2:00 AM",
        price: 100,
        trainId: 404,
        duration: "00h30m",
        stops: [],
        passengers: [],
        date: "Jan 15, 2022",
      ), */
      /*  Trip(
        from: "Mumbai",
        fromCode: "MBI",
        to: "Gugugram",
        toCode: "GGM",
        stationLocation: "Mumbai Train Station",
        departureTime: "01:30",
        arrivalTime: "2:00 AM",
        price: 100,
        trainId: 404,
        duration: "00h30m",
        stops: [],
        passengers: [],
        date: "Jan 15, 2022",
      ) */
    ],
    passengers: [],
    date: "Jan 15, 2022",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: primary30),
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(width: 120),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Selecting Trip to\n${widget.query!.to}",
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "${widget.query!.departure}, ${widget.query!.totalPassengers} Travellers",
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                InkWell(
                  child: TripTile(
                    trip: _trip,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TripDetail(
                        trip: _trip,
                        query: widget.query,
                      );
                    }));
                  },
                )
              ],
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FilterSortPage();
            }));
          },
          child: const Icon(
            Icons.filter_list,
          ),
        ));
  }
}
