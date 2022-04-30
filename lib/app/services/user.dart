import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:irctc_dbms/app/models/notification.dart';
import 'package:irctc_dbms/app/models/ticket.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/services/endpoints.dart';

class UserDataProvider {
  static Future<List<Ticket>> getUserTickets(int currentUserId) async {
    List<Ticket> tickets = [];

    final response =
        await http.get(Uri.parse(userDetails + "$currentUserId/tickets/"));

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

  static Future<String> updateUserDetails(
      int currentUserId, Map<String, dynamic> userNewData) async {
    final response = await http.put(
        Uri.parse(userDetails + "$currentUserId/update"),
        body: jsonEncode(userNewData));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to update user");
    }
  }

  static Future<User> getUserDetails(int currentUserId) async {
    User _currentUser;
    final response =
        await http.get(Uri.parse(userDetails + "$currentUserId/details"));
    if (response.statusCode == 200) {
      _currentUser = User.fromJson(json.decode(response.body));

      return _currentUser;
    } else {
      throw Exception("Failed to update user");
    }
  }

  static Future<List<UserNotification>> getUserNotifications(
      int currentUserId) async {
    List<UserNotification> usernotifications = [];
    final response =
        await http.get(Uri.parse(userDetails + "$currentUserId/notifications"));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var note in jsonList) {
        usernotifications.add(UserNotification.fromJson(note));
      }
      return usernotifications;
    } else {
      throw Exception("Failed to get updates");
    }
  }

  static Future<Map<String, dynamic>> bookTicket(
      Map<String, dynamic> selection) async {
    final response = await http.post(Uri.parse(ticketIssue + "issue"),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.varyHeader: "Accept",
          HttpHeaders.allowHeader: "POST, OPTION"
        },
        body: jsonEncode(selection));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("payment failed");
    }
  }
}

class FakeRazorPayApi {
  static Future<Map<String, dynamic>> paymentGateway(
      Map<String, dynamic> payment) async {
    final response = await http.post(Uri.parse(paymentGatewayUrl),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.varyHeader: "Accept",
          HttpHeaders.allowHeader: "POST, OPTION"
        },
        body: jsonEncode(payment));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("payment failed");
    }
  }
}
