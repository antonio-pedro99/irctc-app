// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/query.dart';
import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/services/trip.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/elements/trip_tile.dart';
import 'package:irctc_dbms/app/views/pages/search/filter_page.dart';
import 'package:irctc_dbms/app/views/pages/search/trip_detail.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  String formatDate(String date) {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
        .format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<QueryModel>(builder: (context, child, model) {
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
                            "Selecting Trip to\n${model.currentQuery!.to}",
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "${model.currentQuery!.departure} ${model.currentQuery!.totalPassengers} Travellers",
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: FutureBuilder<List<Trip>>(
                        future: TripProvider.fetchTrips(
                            model.currentQuery!.from!, model.currentQuery!.to!),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text("${snapshot.error}"),
                            );
                          }
                          //sort the result
                          var result = snapshot.data!.where((element) {
                            var res = formatDate(element.dtDeparture!)
                                .allMatches(model.currentQuery!.departure!);
                            return res.isNotEmpty;
                          });

                          if (result.isNotEmpty) {
                            return ListView.builder(
                                itemCount: result.length,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    child: TripTile(
                                      trip: snapshot.data![index],
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return TripDetail(
                                          trip: snapshot.data![index],
                                          query: model.currentQuery!,
                                        );
                                      }));
                                    },
                                  );
                                }));
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "No result found",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      )))
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
    });
  }
}
