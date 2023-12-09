import 'package:blood_donar/core/entities/moreinformationdata.dart';

class moreinfodatamodel extends moreinfodata{
  moreinfodatamodel({required super.bilirubin, required super.rbc, required super.pic, required super.cholestrol, required super.glucose, required super.mvc, required super.platelets});


  factory moreinfodatamodel.fromJson(Map<String, dynamic> json) {
    return moreinfodatamodel(

      bilirubin: json['bilirubin'].toString(),
      cholestrol: json['cholestrol'].toString(),
      glucose: json['glucose'].toString(),
      mvc:json['mvc'].toString(),
      rbc: json['rbc'].toString(),
      platelets: json['platelets'].toString(),
      pic: json['pic'].toString(),

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "bilirubin":bilirubin,
      "cholestrol": cholestrol,
      "glucose":glucose,
      'mvc': mvc,
      'rbc': rbc,
      'platelets': platelets,
      'pic': pic,


    };
  }
}