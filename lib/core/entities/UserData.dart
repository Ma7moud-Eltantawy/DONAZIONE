class UserData{
  final String? name;
  final bool? open_ofdonation;
  final String? bloodtype;
  final String? location;
  final String? weight;
  final String? email;
  final String? phone;
  final String ?  id;
  final String ?  lat;
  final String ?  lang;
  final String ?  fcmtoken;


  UserData(

  {
    required this.id,
    required this.name,
    required this.bloodtype,
    required this.location,
    required this.weight,
    required this.email,
    required this.phone,
    required this.open_ofdonation,
    required this.lang,
    required this.lat,
    required this.fcmtoken
  });
}