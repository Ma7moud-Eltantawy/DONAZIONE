class RequestData{
  final String ?  id;
  final String? name;
  final String? phone;
  final String? bloodtype;
  final String? location;
  final String? lang;
  final String? lat;
  final String? picurl;
  final String? numofdonate;
  final String? time;
  final bool? donated;



  RequestData(

      {
        required this.id,
        required this.name,
        required this.bloodtype,
        required this.location,
        required this.time,
        required this.phone,
        required this.picurl,
        required this.numofdonate,
        required this.donated,
        required this.lang,
        required this.lat,


      });
}