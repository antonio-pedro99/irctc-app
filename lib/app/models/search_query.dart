import 'package:irctc_dbms/app/models/passenger.dart';

class Query {
  String? from;
  String? to;
  String? departure;
  List<Passenger>? passengers;

  Query({this.from, this.to, this.departure, this.passengers});

  Query.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];

    departure = json['departure'];
    if (json['passengers'] != null) {
      passengers = <Passenger>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passenger.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['departure'] = departure;
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
