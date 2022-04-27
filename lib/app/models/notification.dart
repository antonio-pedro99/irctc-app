class UserNotification {
  String? title;
  int? source;
  String? date;
  String? content;

  UserNotification({this.title, this.source, this.date, this.content});

  UserNotification.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    source = json['source'];
    date = json['date'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['source'] = this.source;
    data['date'] = this.date;
    data['content'] = this.content;

    return data;
  }
}
