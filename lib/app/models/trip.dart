import 'package:irctc_dbms/app/models/passenger.dart';

class Trip {
  String? from;
  String? to;
  int? price;
  String? date;
  String? departureTime;
  String? aririvalTime;
  String? tripId;
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
      this.aririvalTime,
      this.tripId,
      this.trainId,
      this.stationId,
      this.stationLocation,
      this.passengers,
      this.stops});

  Trip.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    price = json['price'];
    date = json['date'];
    departureTime = json['departure_time'];
    aririvalTime = json['aririval_time'];
    tripId = json['trip_id'];
    trainId = json['train_id'];
    stationId = json['station_id'];
    stationLocation = json['station_location'];

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
    data['date'] = date;
    data['departure_time'] = departureTime;
    data['aririval_time'] = aririvalTime;
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
