import 'package:irctc_dbms/app/models/passenger.dart';

class Trip {
  String? from;
  String? to;
  int? price;
  String? date;
  String? departureTime;
  String? arrivalTime;
  String? tripId;
  String? fromCode;
  String? duration;
  String? toCode;
  String? trainId;
  int? stationId;
  String? stationLocation;
  List<Passenger>? passengers;
  List<Trip>? stops;

  Trip(
      {this.from,
      this.to,
      this.price,
      this.date,
      this.departureTime,
      this.arrivalTime,
      this.tripId,
      this.trainId,
      this.stationId,
      this.stationLocation,
      this.fromCode,
      this.duration,
      this.toCode,
      this.passengers,
      this.stops});

  Trip.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    price = json['price'];
    date = json['date'];
    departureTime = json['departure_time'];
    arrivalTime = json['arrival_time'];
    tripId = json['trip_id'];
    trainId = json['train_id'];
    duration = json['duration'];
    stationId = json['station_id'];
    stationLocation = json['station_location'];
    fromCode = json['from_code'];
    toCode = json['toCode'];

    if (json['passengers'] != null) {
      passengers = <Passenger>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passenger.fromJson(v));
      });
    }

    if (json['stops'] != null) {
      stops = <Trip>[];
      json['stops'].forEach((v) {
        stops!.add(Trip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['price'] = price;
    data['duration'] = duration;
    data['date'] = date;
    data['fromCode'] = fromCode;
    data['toCode'] = toCode;
    data['departure_time'] = departureTime;
    data['arrival_time'] = arrivalTime;
    data['trip_id'] = tripId;
    data['train_id'] = trainId;
    data['station_id'] = stationId;
    data['station_location'] = stationLocation;
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    if (stops != null) {
      data['stops'] = stops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
