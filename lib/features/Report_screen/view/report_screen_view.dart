import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/maps/controller/mapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Report_screen extends StatelessWidget {
   Report_screen({Key? key}) : super(key: key);
  List<Map<String, String>> griditems=[
    {"Glucose":"${currentusermoreinfo!.glucose} mmol/L"},{"Cholesterol":"${currentusermoreinfo!.cholestrol} mmol/L"},
    {"Bilirubin":"${currentusermoreinfo!.bilirubin} mmol/L"},
    {"RBC":"${currentusermoreinfo!.rbc} ml/L"},{"MCV":"${currentusermoreinfo!.mvc} fl"},{"platelets":"${currentusermoreinfo!.platelets} bL"}
  ];


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    final MapController con=Get.put(MapController());
    return GetBuilder<MapController>(
      init: MapController(),
      builder:(myCon)=> Scaffold(
        appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,
          title: Text("Report",style: TextStyle(color: Colors.black),),
          centerTitle: true,

          actions: [

          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment:Alignment.center,
              width: width,
              height: height/20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(IconBroken.Location,color: Colors.red,size: width/20,),
                  Container(
                    width: width/2,
                      margin: EdgeInsets.all(width/180),

                      child: Text(currentuserdata!.location!,style:TextStyle(
                        fontSize: width/35
                      ),textDirection:TextDirection.ltr,overflow: TextOverflow.ellipsis,maxLines: 2,)),

                ],
              ),
            ),
            Container(
              height: height/4,
              width: width,
              child: Image.asset('assets/images/lab.png'),
            ),
            Container(
              width: width,

              child: GridView.builder(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics() ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 8.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemCount: 6, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  // Return a widget for each grid item
                  return Card(
                    elevation: 1,
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(width/20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Text( griditems[index]["${griditems[index].keys.first}"].toString(),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width/30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(griditems[index].keys.first,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.black38,
                              fontSize: width/35,
                              fontWeight: FontWeight.normal),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
