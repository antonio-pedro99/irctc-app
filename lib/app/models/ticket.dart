class Ticket {
  String? from;
  String? to;
  int? price;
  String? date;
  String? departureTime;
  String? aririvalTime;
  String? tripId;
  String? trainId;
  int? seat;
  String? barcode;

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
    return data;
  }
}
