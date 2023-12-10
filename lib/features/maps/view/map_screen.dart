import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/Auth/Signup/blood_group/view/blood_group.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/styles/Local_Styles.dart';
import '../../../core/styles/icons.dart';
import '../../../widgets/default_button.dart';
import '../controller/mapcontroller.dart';

class LocScreen extends StatefulWidget {
  static const scid = "loc";

  const LocScreen({Key? key}) : super(key: key);

  @override
  _LocScreenState createState() => _LocScreenState();
}

class _LocScreenState extends State<LocScreen> {
  TextEditingController searchController = TextEditingController();
  late String searchAdd;

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
        ],
        title: Text(
          "Your Location",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsManager.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.white,
        elevation: 0,
      ),
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height / 1.2,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GetBuilder<MapController>(
                    init: MapController(),
                    builder: (con) => ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      child: controller.loading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.red,
                        ),
                      )
                          : GoogleMap(
                        markers: con.markers.values.toSet(),
                        onMapCreated: con.onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: con.currentLatLng!,
                          zoom: 15.0,
                        ),
                        mapType: con.type,
                        onTap: (LatLng tappedPoint) {
                          print(tappedPoint);
                          con.changeCurrentLocation(tappedPoint);
                        },
                        onLongPress: (val) => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildAlertDialog(width, con, context, height),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: height / 5.5,
              right: width / 60,
              child: GestureDetector(
                onTap: () {
                  controller.myLocationNavigate();
                },
                child: Card(
                  color: ColorsManager.red,
                  child: Container(
                    height: height / 20,
                    width: width / 8.8,
                    child: Icon(
                      Icons.my_location_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height / 8,
              right: width / 60,
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      buildAlertDialog(width, controller, context, height),
                ),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    height: height / 20,
                    width: width / 8.8,
                    child: Icon(
                      Icons.map_outlined,
                      size: 18,
                      color: ColorsManager.red,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height / 12,
              right: width / 18,
              left: width / 18,
              child: Opacity(
                opacity: .8,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    cursorColor: ColorsManager.red,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search,color: ColorsManager.red,),
                        onPressed: () {
                          controller.searchNavigate(searchAdd);
                        },
                        iconSize: width / 15,
                      ),
                      hintText: 'search',
                      hintStyle: TextStyle(
                        fontFamily: 'RB',
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: width / 50,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        searchAdd = val;
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              right: width / 7,
              left: width / 35,
              bottom: height / 23,
              child: GetBuilder<MapController>(
                builder: (con) => DefaultButton(
                  onPressed: () {

                    Get.to(bloodgroup_Screen());
                  },
                  text: 'Save',
                  titleColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog(double width, MapController pr, BuildContext context, double height) {
    return AlertDialog(
      actions: <Widget>[
        Center(
          child: Column(
            children: [
              Text(
                'Change the map style!',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: ColorsManager.red,
                  fontSize: width / 22,
                ),
              ),
              buildMapTypeButton(width, pr, context, height, 'Normal', 'assets/images/map3.png', MapType.normal),
              buildMapTypeButton(width, pr, context, height, 'Satellite', 'assets/images/map1.png', MapType.hybrid),
              buildMapTypeButton(width, pr, context, height, 'Traffic', 'assets/images/map2.png', MapType.terrain),
            ],
          ),
        )
      ],
    );
  }

  Widget buildMapTypeButton(double width, MapController pr, BuildContext context, double height, String label, String imagePath, MapType mapType) {
    return TextButton(
      onPressed: () {
        pr.changeMapType(mapType);
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.red,
              fontSize: width / 25,
            ),
          ),
          SizedBox(width: 10.0),

          Image.asset(
            imagePath,
            height: height / 15,
            width: width / 12,
          ),
        ],
      ),
    );
  }
}