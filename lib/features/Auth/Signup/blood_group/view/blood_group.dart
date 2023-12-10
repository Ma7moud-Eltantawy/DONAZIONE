import 'package:animate_do/animate_do.dart';
import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Auth/Signup/Moreinformation/view/moreinformation_screen.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/controller/Signup_Controller.dart';
import 'package:blood_donar/features/Auth/Signup/blood_group/controller/bloodgroup_controller.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/view/Signup_Screen.dart';
import 'package:blood_donar/features/Home/Home_Screen/home_Screen/view/homescreen_view.dart';
import 'package:blood_donar/features/maps/controller/mapcontroller.dart';
import 'package:blood_donar/features/maps/view/map_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../core/manager/colors_manager.dart';
import '../../../../../widgets/button_loading.dart';
import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/text_field.dart';
import '../../../login/login_controller.dart';
class bloodgroup_Screen extends StatelessWidget {
  bloodgroup_Screen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final signup_Controller controller = Get.put(signup_Controller());
  final MapController controller2=Get.put(MapController());


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Stack(
            alignment: Alignment.center,
            children: [
              Transform(

                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(-1.0,1.0),
                child:Container(
                  child: Image.asset('assets/images/Rectangle 5.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text('blood type',style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: width/15),textDirection: TextDirection.rtl,),

                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text('blood type',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: width/30),textDirection: TextDirection.rtl,),
                SizedBox(width: width/50,),
                Image.asset('assets/images/Ellipse 2.png',color: Colors.red,width: width/40,),
              ],
            ),
          ),
          GetBuilder<signup_Controller>(
            builder:(con)=> Container(

              height: height/4,
              padding: EdgeInsets.symmetric(horizontal: width/40,vertical: width/80),
              child: GridView.count(
                dragStartBehavior: DragStartBehavior.start,
                primary: true,
                padding:  EdgeInsets.all(width/40),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4, // Number of columns in the grid
                children: List.generate(8, (index) {
                  return InkWell(
                    focusColor: Colors.redAccent,
                    onTap: (){
                      con.choose_bloodtype(index);
                    },


                    child: Container(
                      decoration: BoxDecoration(
                        color: con.blood_type_index!=index?Colors.transparent:ColorsManager.red,
                        border: Border.all(
                          color: con.blood_type_index!=index?Colors.black26:Colors.black12,
                          width: width/250,

                        ),
                        borderRadius: BorderRadius.circular(width/40,),

                      ),
                      height: height/190,
                      // Each grid item is wrapped in a container
                      margin: EdgeInsets.all(width/50),
                      child: Center(
                        child: Text(
                          '${con.blood_groub[index]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: con.blood_type_index!=index?Colors.black:Colors.white,
                            fontSize: width/20,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Text('location',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: width/30),textDirection: TextDirection.rtl,),
                SizedBox(width: width/50,),
                Icon(IconBroken.Location,size: width/30,color: Colors.red,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width/20,vertical: width/25),
            margin: EdgeInsets.symmetric(horizontal: width/20,vertical: width/20),
            height: height/13,

            decoration: BoxDecoration(
                color: Colors.black12,
              borderRadius: BorderRadius.circular(width/30)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Icon(IconBroken.Location,size: width/30,color: Colors.black,),
                    SizedBox(width: width/50,),
                    Container(
                      width: width/1.8,
                      child: GetBuilder<MapController>(
                        builder:(_)=> Text(controller2.myLoc!,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: width/30),
                          textDirection: TextDirection.rtl, overflow: TextOverflow.ellipsis,
                        softWrap: true,),
                      ),
                    ),

                  ],
                ),
                IconButton(
                 iconSize:width/20 ,
                  splashRadius: width/30,
                  splashColor: Colors.redAccent.withOpacity(0.3),
                  icon: Icon(IconBroken.Edit_Square,size: width/20,color: Colors.red,),onPressed: (){

                   Get.to(LocScreen());
                },),



              ],

            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: width/40),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<signup_Controller>(builder:(con)=> Text('${controller.current_weight.toString()}  kgs',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: width/30),textDirection: TextDirection.ltr,)),

              Row(
                children: [


                  Text('weight',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: width/30),textDirection: TextDirection.rtl,),
                  SizedBox(width: width/50,),
                  Icon(IconBroken.User,size: width/30,color: Colors.red,),


                ],
              ),



            ],

          )),

          GetBuilder<signup_Controller>(
            builder:(con)=> Container(
              padding: EdgeInsets.symmetric(horizontal: width/50),
              child: FlutterSlider(

                values: [con.current_weight],
                max: 250,
                min: 0,
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  con.changeweight(lowerValue.toDouble());


                  print(lowerValue);

                },
                handler: FlutterSliderHandler(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.monitor_weight_outlined,
                    color: Colors.white,
                  ),
                ),
                trackBar: FlutterSliderTrackBar(
                  activeTrackBarHeight: width/90,
                  activeTrackBar: BoxDecoration(
                    color: Colors.red,
                  ),
                  inactiveTrackBarHeight: width/90,
                  inactiveTrackBar: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          GetBuilder<signup_Controller>(
            builder:(con)=>con.loading==true? ButtonLoading(): DefaultButton(onPressed: ()async{
              Get.to(MoreInformationScreen());

            }, text: "Done"),
          )


        ],
      ),
    );
  }
}
