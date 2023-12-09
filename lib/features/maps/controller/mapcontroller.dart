import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googleapis/calendar/v3.dart';

import '../../../core/constants.dart';

class MapController extends GetxController {
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
    await getCurrentLocation();

    update();
  }


  Future<void> getCurrentLocation() async {
    var currentPosition =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentLatLng = LatLng(currentPosition.latitude, currentPosition.longitude);
    await getPlace(currentLatLng!.latitude, currentLatLng!.latitude);
    longLat = currentLatLng;
    loading = false;
  }

  void changeloading() {
    loading = !loading;
    update();
  }

  void changeMapType(MapType mapType) {
    type = mapType;
    update();
  }

  void onMapCreated(controller) {
    mapController = controller;
    update();
  }

  Future<void> myLocationNavigate() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: currentLatLng!, zoom: 17),
    ));
    await getPlace(currentLatLng!.latitude, currentLatLng!.longitude);

    final marker = createMarker(currentLatLng!, 'place_name');
    markers[const MarkerId('place_name')] = marker;
    await getPlace(currentLatLng!.latitude, currentLatLng!.latitude);
    update();
  }

  Future<void> searchNavigate(String searchAdd) async {
    locationFromAddress(searchAdd).then((result) async {
      await getPlace(result[0].latitude, result[0].longitude);
      longLat = LatLng(result[0].latitude, result[0].longitude);

      final marker = createMarker(longLat!, 'place_name');
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: longLat!, zoom: 16),
      ));
      markers[const MarkerId('place_name')] = marker;
    });
    update();
  }

  Future<void> getPlace(double lat, double long) async {
    var placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placeMark = placemarks.first;

    city = placeMark.administrativeArea;
    country = placeMark.country;
    locality = placeMark.locality;
    address = "$locality,$city,$country";
    name = placeMark.name;
    myLoc = '$name, $city, $locality ,$country';
    update();
  }


  Future<void> changeCurrentLocation(LatLng result) async {
    await getPlace(result.latitude, result.longitude);
    longLat = LatLng(result.latitude, result.longitude);

    final marker = createMarker(longLat!, 'place_name');
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: longLat!, zoom: 16),
    ));
    markers[const MarkerId('place_name')] = marker;
    getPlace(result.latitude, result.longitude);
    update();
  }

  void saveData() {
    //currentLoc = '$name ,$locality,$city,$country';
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
  }
/*****************************/

  Future<void> getreqplace(double lat, double long) async {
    var placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placeMark = placemarks.first;

    city = placeMark.administrativeArea;
    country = placeMark.country;
    locality = placeMark.locality;
    address = "$locality,$city,$country";
    name = placeMark.name;
    myLoc = '$name, $city, $locality ,$country';
    update();
  }
  Future<void> getrequsermarkers({required LatLng latlng}) async {

    await getPlace(latlng.latitude, latlng.longitude);

    final marker = createMarker(currentLatLng!, 'reqplace');
    markers[const MarkerId('reqplace')] = marker;
    await getreqplace(currentLatLng!.latitude, currentLatLng!.latitude);
    update();
  }


}