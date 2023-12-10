import 'package:blood_donar/core/entities/Requestdata.dart';

class Requestdatamodel extends RequestData{
  Requestdatamodel({required super.lang,required super.lat,required super.id,required super.donated, required super.name, required super.bloodtype, required super.location, required super.time, required super.phone, required super.picurl, required super.numofdonate});



  // Useralldatamodel({required super.id,required super.name, required super.bloodtype, required super.location, required super.weight, required super.email, required super.phone, required super.open_ofdonation});
  factory Requestdatamodel.fromJson(Map<String, dynamic> json) {
    return Requestdatamodel(

      name: json['name'].toString(),
      bloodtype: json['bloodtype'].toString(),
      location: json['location'].toString(),
      phone:json['phone'].toString(),
      id: json['id'].toString(),
      numofdonate: json['timedonated'].toString(),
      picurl: json['pic'].toString(),
      time: json['reqtime'].toString(),
      donated:json['donated'],
      lat:json['lat'],
      lang:json['lang']


    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name": name,
      'bloodtype': bloodtype,
      'location': location,
      'timedonated': numofdonate,
      'pic': picurl,
      'phone':phone,
      'donated':donated,
      'reqtime':time,
      'lang':lang,
      'lat':lat,

    };
  }
}