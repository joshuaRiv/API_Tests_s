// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  int code;
  List<Datum> data;

  Welcome(this.code, [this.data = const []]);

  factory Welcome.fromJson(dynamic json) {
    if (json['data'] != null) {
      var dataObjsJson = json['data'] as List;
      List<Datum> _data =
          dataObjsJson.map((dataJson) => Datum.fromJson(dataJson)).toList();

      return Welcome(
        json["code"] as int,
        _data,
      );
    } else {
      return Welcome(
        json["code"] as int,
      );
    }
  }

  @override
  String toString() {
    return '{ ${this.code}, ${this.data},}';
  }
}

class Datum {
  Datum(
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
    this.createdAt,
    this.updatedAt,
  );

  int id;
  String name;
  String email;
  String gender;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(dynamic json) {
    return Datum(
      json["id"] as int,
      json["name"] as String,
      json["email"] as String,
      json["gender"] as String,
      json["status"] as String,
      DateTime.parse(json["created_at"]),
      DateTime.parse(json["updated_at"]),
    );
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.email}, ${this.gender}, ${this.status}, ${this.name}, ${this.createdAt}, ${this.updatedAt} }';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
