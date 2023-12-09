import 'package:blood_donar/core/entities/UserData.dart';

class Userdatamodel extends UserData
{
  Userdatamodel({required super.lang,required super.lat,required super.fcmtoken,required super.id,required super.name, required super.bloodtype, required super.location, required super.weight, required super.email, required super.phone, required super.open_ofdonation});
  factory Userdatamodel.fromJson(Map<String, dynamic> json) {
    return Userdatamodel(
      open_ofdonation: json['opendonation'],
        name: json['name'].toString(),

        bloodtype: json['bloodtype'].toString(),
        location: json['location'].toString(),
        weight: json['weight'].toString(),
        email: json['email'].toString(),
        phone:json['phone'].toString(),
        id: json['id'].toString(),
      lat:json['lat'].toString(),
      lang: json['lang'].toString(),
      fcmtoken: json['fcmtoken'].toString(),

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name": name,
      "opendonation":true,
      'bloodtype': bloodtype,
      'location': location,
      'weight': weight,
      'email': email,
      'phone':phone,
      'lat':lat,
      'lang':lang,
      'fcmtoken':fcmtoken
    };
  }
}