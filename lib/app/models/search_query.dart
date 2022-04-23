import 'package:irctc_dbms/app/models/passenger.dart';

class Query {
  String? from;
  String? to;
  String? departure;
  String? returnDate;
  int? totalPassengers;
  Map<String, int>? passengers;

  Query(
      {this.from,
      this.to,
      this.departure,
      this.passengers,
      this.returnDate,
      this.totalPassengers});

  Query.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    departure = json['departure'];
    returnDate = json["returnDate"];
    passengers = json['passengers'];
    totalPassengers = json["totalPassengers"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['departure'] = departure;
    data["returnDate"] = returnDate;
    data["totalPassengers"] = totalPassengers;
    data['passengers'] = passengers;
    return data;
  }
}
