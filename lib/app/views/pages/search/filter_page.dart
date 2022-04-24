import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/scoped/query.dart';
import 'package:irctc_dbms/app/views/elements/rounded_button.dart';
import 'package:irctc_dbms/app/views/elements/sort_by_tile.dart';
import 'package:irctc_dbms/app/views/elements/time_tile.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class FilterSortPage extends StatelessWidget {
  const FilterSortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<QueryModel>(builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            centerTitle: true,
            elevation: 0,
            title: const Text("Filter and Sort"),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: primary30),
          ),
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              const Text("Sort by",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w200, fontSize: 16, color: grey)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SortByTile(
                    label: "Price",
                    isSelected: true,
                    onTap: () {},
                  ),
                  SortByTile(
                    label: "Departure Time",
                    isSelected: false,
                    onTap: () {},
                  ),
                  SortByTile(
                    label: "Arrival Time",
                    isSelected: false,
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text("Departure Time",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w200, fontSize: 16, color: grey)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeTile(
                    icon: Icons.wb_sunny_sharp,
                    onTap: () => {},
                    period: "Early Morning",
                    timeRange: "00:00 - 04:59 AM",
                    isSelected: false,
                  ),
                  TimeTile(
                    icon: Icons.cloudy_snowing,
                    onTap: () => {},
                    period: "Morning",
                    timeRange: "05:00 - 11:59 AM",
                    isSelected: false,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeTile(
                    icon: Icons.mode_night,
                    onTap: () => {},
                    period: "Afternoon",
                    timeRange: "12:00 - 05:59 PM",
                    isSelected: true,
                  ),
                  TimeTile(
                    icon: Icons.nightlight,
                    onTap: () => {},
                    period: "Evening",
                    timeRange: "06:00 - 10:59 PM",
                    isSelected: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Arrival Time",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w200, fontSize: 16, color: grey)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeTile(
                    icon: Icons.wb_sunny_sharp,
                    onTap: () => {},
                    period: "Early Morning",
                    timeRange: "00:00 - 04:59 AM",
                    isSelected: false,
                  ),
                  TimeTile(
                    icon: Icons.cloudy_snowing,
                    onTap: () => {},
                    period: "Morning",
                    timeRange: "05:00 - 11:59 AM",
                    isSelected: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeTile(
                    icon: Icons.mode_night,
                    onTap: () => {},
                    period: "Afternoon",
                    timeRange: "12:00 - 05:59 PM",
                    isSelected: false,
                  ),
                  TimeTile(
                    icon: Icons.nightlight,
                    onTap: () => {},
                    period: "Evening",
                    timeRange: "06:00 - 10:59 PM",
                    isSelected: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                  label: "Apply filter",
                  labelColor: Colors.white,
                  onPress: () {
                    Navigator.pop(context);
                  })
            ],
          ));
    });
  }
}
