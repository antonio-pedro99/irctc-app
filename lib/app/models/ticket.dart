class Ticket {
  String? from;
  String? to;
  double? price;
  String? date;
  String? departureTime;
  String? aririvalTime;
  int? tripId;
  int? trainId;
  int? seat;
  String? barcode;
  int? passengerId;

  Ticket(
      {this.from,
      this.to,
      this.price,
      this.date,
      this.departureTime,
      this.aririvalTime,
      this.tripId,
      this.trainId,
      this.barcode,
      this.passengerId,
      this.seat});

  Ticket.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    price = json['price'];
    date = json['date'];
    departureTime = json['departure_time'];
    aririvalTime = json['aririval_time'];
    tripId = json['trip_id'];
    trainId = json['train_id'];
    seat = json["seat"];
    passengerId = json["passenger_id"];
    barcode = json['barcode'];
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
    data['barcode'] = barcode;
    data["seat"] = seat;
    data["passenger_id"] = passengerId;
    return data;
  }
}
