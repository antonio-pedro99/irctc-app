class Trip {
  String? locationFrom;
  String? localMetrostation;
  String? locationCode;
  String? destinationTo;
  String? destinationMetrostation;
  String? destinationCode;
  double? price;
  int? tripId;
  String? dtDeparture;
  int? duration;
  int? trainId;
  String? dtArrival;

  Trip(
      {this.locationFrom,
      this.localMetrostation,
      this.locationCode,
      this.destinationTo,
      this.destinationMetrostation,
      this.destinationCode,
      this.price,
      this.tripId,
      this.dtDeparture,
      this.duration,
      this.trainId,
      this.dtArrival});

  Trip.fromJson(Map<String, dynamic> json) {
    locationFrom = json['location_from'];
    localMetrostation = json['local_metrostation'];
    locationCode = json['location_code'];
    destinationTo = json['destination_to'];
    destinationMetrostation = json['destination_metrostation'];
    destinationCode = json['destination_code'];
    price = json['price'];
    tripId = json['trip_id'];
    dtDeparture = json['dt_departure'];
    duration = json['duration'];
    trainId = json['train_id'];
    dtArrival = json['dt_arrival'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location_from'] = locationFrom;
    data['local_metrostation'] = localMetrostation;
    data['location_code'] = locationCode;
    data['destination_to'] = destinationTo;
    data['destination_metrostation'] = destinationMetrostation;
    data['destination_code'] = destinationCode;
    data['price'] = price;
    data['trip_id'] = tripId;
    data['dt_departure'] = dtDeparture;
    data['duration'] = duration;
    data['train_id'] = trainId;
    data['dt_arrival'] = dtArrival;
    return data;
  }
}
