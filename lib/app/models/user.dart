class User {
  String? email;
  String? phone;
  int? id;
  int? age;
  String? name;

  User({this.email, this.phone, this.id, this.age, this.name});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    age = json['age'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    data['id'] = id;
    data['age'] = age;
    data['name'] = name;
    return data;
  }
}
