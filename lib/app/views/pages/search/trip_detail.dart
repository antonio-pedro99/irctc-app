import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';

import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/views/elements/trip_tile.dart';

class TripDetail extends StatefulWidget {
  const TripDetail({Key? key, this.trip}) : super(key: key);

  final Trip? trip;
  @override
  State<TripDetail> createState() => _TripDetailState();
}

class _TripDetailState extends State<TripDetail> {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Selecting Trip to\n${widget.trip!.to}",
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "${widget.trip!.date}, 4 Travellers",
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Total",
                                ),
                                Text("Rs ${widget.trip!.price}",
                                    style: const TextStyle(fontSize: 24))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(12),
              children: [],
            ))
          ],
        ));
  }
}
