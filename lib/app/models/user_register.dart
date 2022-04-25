class UserRegister {
  String? email;
  String? phone;
  String? name;
  String? password;

  UserRegister({this.email, this.phone, this.name, this.password});

  UserRegister.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    data['name'] =name;
    data['password'] = password;
    return data;
  }
}
