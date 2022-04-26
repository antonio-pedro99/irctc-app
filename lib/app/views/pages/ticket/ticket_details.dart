import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/views/elements/box_rectangle.dart';

class TicketDetailPage extends StatefulWidget {
  const TicketDetailPage({Key? key, this.ticket}) : super(key: key);

  final Ticket? ticket;
  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  String formatTime(String date) {
    return DateFormat(DateFormat.HOUR24_MINUTE).format(DateTime.parse(date));
  }

  String formatDate(String date) {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
        .format(DateTime.parse(date));
  }

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
                height: MediaQuery.of(context).size.height / 3.8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              const SizedBox(width: 100),
                              /*  const Text("Tickets",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  )) */
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formatDate(widget.ticket!.departure!)),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text("${widget.ticket!.location}",
                                    strutStyle: StrutStyle.disabled,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(formatTime(widget.ticket!.departure!)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rs ${widget.ticket!.price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )
                              ],
                            ),
                            /*  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                TrainCircle(
                                  background: Colors.white,
                                  iconColor: primary,
                                  radius: 20,
                                ),
                              ],
                            ) ,*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Trip: ${widget.ticket!.tripId}"),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text("${widget.ticket!.destination}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(formatTime(widget.ticket!.arrival!)),
                                const SizedBox(
                                  height: 70,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                BoxRectangle(
                  title: "Train info",
                  height: 125,
                  color: Colors.white,
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.train_sharp,
                            size: 25,
                            color: primary,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Train ${widget.ticket!.trainId}",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.airline_seat_recline_extra_sharp,
                            size: 25,
                            color: primary,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Seat ${widget.ticket!.seat}",
                              style: const TextStyle(
                                fontSize: 18,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                BoxRectangle(
                  title: "Save for control",
                  height: 125,
                  color: Colors.white,
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.print,
                            size: 25,
                            color: primary,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Print/Download",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.share,
                            size: 25,
                            color: primary,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Share",
                              style: TextStyle(
                                fontSize: 18,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
