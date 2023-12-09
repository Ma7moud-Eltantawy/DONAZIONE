import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/widgets/profile_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/Models/Request_model.dart';
class Requests_Listview extends StatelessWidget {
  const Requests_Listview({
    super.key,
    required this.height,
    required this.width,
    required this.scroll,
    required this.Requests,


  });

  final double height;
  final double width;
  final bool scroll;
  final List<Requestdatamodel> Requests;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index)=>SizedBox(height: height/150,),
      shrinkWrap: true,
      physics: scroll==true?ScrollPhysics():NeverScrollableScrollPhysics(),
      itemCount: Requests.length,
      itemBuilder: (context,index)=>
          InkWell(
            onTap: ()
            {
              
              Profile_bottom_sheet(context: context,reqmodel: Requests[index], height: height,width: width);
            },
            child: Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width/10), // Adjust the radius value as needed
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width/20,vertical: width/80),
                padding: EdgeInsets.symmetric(horizontal: width/15,vertical: width/40),
                height: height/5,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width/10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,


                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name:",style: TextStyle(color: Colors.black38),),
                        Container(
                            width: width/2.5,
                            child: Text(Requests[0].name!,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)),
                        SizedBox(height:height/250,),
                        Text("Location:",style: TextStyle(color: Colors.black38),),
                        Container(
                            width: width/2.5,
                            child: Text(Requests[0].lang!,overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)),

                        SizedBox(height:height/250,),
                        Container(
                            width: width/2.5,
                            child: DateTime.now().difference(DateTime.parse(Requests[0].time!)).inHours<24?
                            Text("${DateTime.now().difference(DateTime.parse(Requests[0].time!)).inHours} Hours Ago"
                              ,style: TextStyle(color: Colors.black38),
                              overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)
                                :Text("${DateTime.now().difference(DateTime.parse(Requests[0].time!)).inDays} Days Ago"
                              ,style: TextStyle(color: Colors.black38),
                              overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,)),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: height/15,
                          width: width/10,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/Blood Group.png",),
                                  fit: BoxFit.fill
                              )
                          ),
                          child: Center(child: Text(Requests[0].bloodtype!,textDirection: TextDirection.ltr,style: TextStyle(
                              color: Colors.white
                          ),)),
                        ),
                        InkWell(
                          overlayColor:MaterialStateProperty.all(Colors.red),
                          onTap: (){
                            
                          },
                          child: Text("Donate",style: TextStyle(
                            color: ColorsManager.red,
                            fontWeight: FontWeight.bold
                          ),),
                        ),

                      ],
                    )
                  ],
                ),

              ),
            ),
          ),

    );
  }
}