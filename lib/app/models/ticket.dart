class Ticket {
  int? passengerId;
  int? tripId;
  int? ticketId;
  String? location;
  String? destination;
  double? price;
  String? departure;
  String? arrival;
  int? trainId;
  int? seat;

  Ticket(
      {this.passengerId,
      this.tripId,
      this.ticketId,
      this.location,
      this.destination,
      this.price,
      this.departure,
      this.trainId,
      this.arrival,
      this.seat});

  Ticket.fromJson(Map<String, dynamic> json) {
    passengerId = json['passenger_id'];
    tripId = json['trip_id'];
    ticketId = json['ticket_id'];
    location = json['location'];
    destination = json['destination'];
    price = json['price'];
    trainId = json['traindId'];
    departure = json['departure'];
    arrival = json['arrival'];
    seat = json['seat'];
  }
}
