import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googleapis/calendar/v3.dart';

import '../../../core/constants.dart';

class req_mapcontroller extends GetxController {


  final LatLng? req_latlng;
  req_mapcontroller({required this.req_latlng});
  MapType type = MapType.normal;
  String? newLang;
  String? newLat;
  LatLng? currentLatLng;
  LatLng? longLat;
  int? locationId;
  String? myLoc;
  bool loading = false;

  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<MarkerId, Marker> reqmarkers = <MarkerId, Marker>{};

  String? city;
  String? country;
  String? address;
  String? name;
  String? locality;

  @override
  Future<void> onInit() async {
    super.onInit();
    changeloading();
    print(req_latlng!.longitude.toString());

    await getrequsermarkers(latlng:req_latlng!);
    print(reqmarkers.length);
    changeloading();

    update();
  }
  changeloading()
  {
    loading=!loading;
    update();
  }
  void onMapCreated(controller) {
    mapController = controller;
    update();
  }

  Future<void> getreqplace(double lat, double long) async {
    var placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placeMark = placemarks.first;

    city = placeMark.administrativeArea;
    country = placeMark.country;
    locality = placeMark.locality;
    address = "$locality,$city,$country";
    name = placeMark.name;
    update();
  }
  Marker createMarker(LatLng position, String markerId) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(
        title: address,
      ),
    );
    update();
  }
  Future<void> getrequsermarkers({required LatLng latlng}) async {

    await getreqplace(latlng.latitude, latlng.longitude);

    final marker = createMarker(latlng, 'reqplace');
    reqmarkers[const MarkerId('reqplace')] = marker;
    await getreqplace(latlng.latitude, latlng.latitude);
    update();
  }


}