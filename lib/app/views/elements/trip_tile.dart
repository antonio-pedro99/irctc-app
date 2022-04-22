import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/views/elements/bubble_line.dart';

class TripTile extends StatelessWidget {
  const TripTile({Key? key, this.trip}) : super(key: key);

  final Trip? trip;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var _stops = trip!.stops!.length;
    return Card(
      borderOnForeground: false,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 130,
        width: media.width,
        decoration: BoxDecoration(
            color: primary30, borderRadius: BorderRadius.circular(13)),
        child: DefaultTextStyle(
            style: const TextStyle(color: swatch, fontWeight: FontWeight.w100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. ${trip!.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Text(
                        "Per person",
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${trip!.fromCode}",
                            strutStyle: StrutStyle.disabled,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                        Text(
                          "${trip!.departureTime} AM",
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${trip!.duration}",
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                        const BubbleLine(),
                        Text( _stops > 0? 
                          "${trip!.stops!.length} stops" : "Non-Stop",
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${trip!.toCode}",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                        Text(
                          "${trip!.arrivalTime}",
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
