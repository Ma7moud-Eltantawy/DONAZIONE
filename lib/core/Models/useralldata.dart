import 'package:blood_donar/core/entities/UserData.dart';
import 'package:blood_donar/core/entities/useralldata.dart';

class AllUsersdatamodel extends AllUserData
{
  AllUsersdatamodel(
  {
    required super.id,
    required super.timedonated,
    required super.pic,
    required super.phone,
    required super.location,
    required super.bloodtype,
    required super.name
  });



 // Useralldatamodel({required super.id,required super.name, required super.bloodtype, required super.location, required super.weight, required super.email, required super.phone, required super.open_ofdonation});
  factory AllUsersdatamodel.fromJson(Map<String, dynamic> json) {
    return AllUsersdatamodel(

      name: json['name'].toString(),
      bloodtype: json['blood_type'].toString(),
      location: json['location'].toString(),
      phone:json['phone'].toString(),
      id: json['id'].toString(),
      timedonated: json['timedonated'].toString(),
      pic: json['pic'].toString(),

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name": name,
      "opendonation":true,
      'bloodtype': bloodtype,
      'location': location,
      'timedonated': timedonated,
      'pic': pic,
      'phone':phone,

    };
  }
}