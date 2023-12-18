// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

CustomerDetails todoFromJson(String str) => CustomerDetails.fromJson(json.decode(str));

String todoToJson(CustomerDetails data) => json.encode(data.toJson());

class CustomerDetails {
  int ?id;
  String ?name;
  String ?address;
  String ?email;
  String ?phone;

  CustomerDetails({
    this.id,
    this.name,
    this.address,
    this.email,
    this.phone,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => CustomerDetails(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "email": email,
    "phone": phone,
  };
}
