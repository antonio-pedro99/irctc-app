import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/views/elements/train_circle.dart';

class StopTripTile extends StatelessWidget {
  const StopTripTile({Key? key, this.trip}) : super(key: key);

  final Trip? trip;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: const TextStyle(fontWeight: FontWeight.normal, color: primary),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: 1,
                  color: swatch,
                ),
                const Positioned(
                    child: TrainCircle(
                  iconColor: Colors.white,
                  background: swatch,
                  radius: 15,
                ))
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${trip!.locationCode} - ${trip!.locationFrom}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: primary)),
                const SizedBox(height: 10),
                Text(
                  "${trip!.dtDeparture} AM",
                ),
                const SizedBox(height: 5),
                Text(
                  "Train ${trip!.trainId}",
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                Text(
                  "${trip!.duration}",
                )
              ],
            ))
          ],
        ));
  }
}
