import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:irctc_dbms/app/models/trip.dart';
import 'package:irctc_dbms/app/services/endpoints.dart';

class TripProvider {
  static Future<List<Trip>> fetchTrips(
      String location, String destination) async {
    List<Trip> trips_dumb = [];

    final response =
        await http.get(Uri.parse("$trips/$location/to/$destination"));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var note in jsonList) {
        trips_dumb.add(Trip.fromJson(note));
      }
      return trips_dumb;
    } else {
      throw Exception("Failed to fetch trips");
    }
  }
}
