import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/services/endpoints.dart';

class UserDataProvider {
  static Future<List<Ticket>> fetchticket(int currentUserId) async {
    List<Ticket> tickets = [];

    final response =
        await http.get(Uri.parse(user + "/$currentUserId/tickets"));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var note in jsonList) {
        tickets.add(Ticket.fromJson(note));
      }
      return tickets;
    } else {
      throw Exception("Failed to fetch tickets");
    }
  }
}
