import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/train_circle.dart';

class TicketTile extends StatelessWidget {
  const TicketTile({Key? key, this.ticket}) : super(key: key);

  final Ticket? ticket;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Card(
      borderOnForeground: false,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 125,
        width: media.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: DefaultTextStyle(
            style: const TextStyle(color: grey, fontWeight: FontWeight.w100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${ticket!.date}",
                    ),
                    Text("${ticket!.from}",
                        strutStyle: StrutStyle.disabled,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    Text(
                      "${ticket!.departureTime} AM",
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    TrainCircle(
                      background: primary,
                      iconColor: Colors.white,
                      radius: 20,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Trip: ${ticket!.tripId}"),
                    Text("${ticket!.to}",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20)),
                    Text(
                      "${ticket!.aririvalTime} PM",
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
