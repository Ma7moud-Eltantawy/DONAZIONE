import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/Profile/controller/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis/mybusinessbusinessinformation/v1.dart';

import '../../../core/constants.dart';
import '../../../core/styles/icons.dart';
import '../../../widgets/contact_me.dart';
class My_profile extends StatelessWidget {
  const My_profile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    profile_Controller controller=Get.put(profile_Controller());
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return GetBuilder<profile_Controller>(
      builder:(con)=> Scaffold(
        backgroundColor: Colors.white.withOpacity(.97),
        appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,
          title: Text("Profile",style: TextStyle(color: Colors.black),),
          leading: Icon(IconBroken.Edit_Square,color: Colors.black,) ,
          centerTitle: true,

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: currentusermoreinfo!.pic,
                placeholder: (context, url) =>
                    Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.red,
                          strokeWidth: 1.5,
                        )),
                errorWidget: (context, url, error) =>
                    Icon(
                      Icons.error,
                      color:ColorsManager.red ,
                    ),
                imageBuilder: (context, imageProvider) =>
                    Container(
                      height: height/6,
                      width: width/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width/30),
                        color: Colors.red,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover
                        )
                      ),

                    ),
              ),
            ),
            SizedBox(height: height/40,),
            Text(currentuserdata!.name!,style: TextStyle(fontSize: width/20,fontWeight:FontWeight.bold ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(IconBroken.Location,color: ColorsManager.red,size: width/18,),
                Container(
                  width: width/2,
                  child: Text(currentuserdata!.location!,
                  style: TextStyle(
                    fontSize: width/20,
                    color: Colors.black54
                  ),
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,

                ),),
                SizedBox(width: width/50,),


              ],
            ),

            SizedBox(height: height/30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                moreinformation(width: width, height: height,text: "05",type_text: "Donated",),
                moreinformation(width: width, height: height,text: "02",type_text: "Requested",),
                moreinformation(width: width, height: height,text: currentuserdata!.bloodtype!,type_text: "Blood Type",),

              ],
            ),
            SizedBox(height: height/100,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: width/60,vertical: width/100),
               height: height/15,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(width/50)
               ),
               child: ListTile(
                 trailing: Switch(
                   activeColor: ColorsManager.red,
                   value: con.availabledonate,onChanged: (val){
                   con.Changeavailabledonate();
                 },),
                 leading:Icon(Icons.schedule,color: ColorsManager.red,size: width/13,) ,
                title: Text("Available for donate",textDirection: TextDirection.ltr,),

            ),
             ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width/60,vertical: width/100),
              height: height/15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width/50)
              ),
              child: ListTile(
                leading:Icon(Icons.email_outlined,color: ColorsManager.red,size: width/13,) ,
                title: Text("Invite a friend",textDirection: TextDirection.ltr,),

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width/60,vertical: width/100),
              height: height/15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width/50)
              ),
              child: ListTile(
                leading:Icon(IconBroken.Info_Square,color: ColorsManager.red,size: width/13,) ,
                title: Text("Contact me",textDirection: TextDirection.ltr,),
                onTap: ()
                {
                  Contactme_bottom_sheet(context, height, width);
                  /*showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(),
                  );*/
                },

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width/60,vertical: width/100),
              height: height/15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width/50)
              ),
              child: InkWell(
                onTap: ()
                {
                  con.logout();
                },
                child: ListTile(
                  leading:Icon(IconBroken.Logout,color: ColorsManager.red,size: width/13,) ,
                  title: Text("Sign out",textDirection: TextDirection.ltr,),

                ),
              ),
            ),
            SizedBox(height: height/10),


          ],
        ),
      ),
    );
  }
}

class moreinformation extends StatelessWidget {
  const moreinformation({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.type_text,

  });

  final double width;
  final double height;
  final String text;
  final String type_text;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width/4,
      height: height/8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(width/20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text,textDirection: TextDirection.ltr,style: TextStyle(
            fontSize: width/18,
            fontWeight: FontWeight.bold
          ),),
          Text(type_text,textDirection: TextDirection.ltr,style: TextStyle(
              fontSize: width/30,
              fontWeight: FontWeight.normal,
            color: Colors.black45
          ),)
        ],
      ),
    );
  }
}
