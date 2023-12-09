import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/styles/icons.dart';
import 'material_button.dart';
import 'package:url_launcher/url_launcher.dart';


TextEditingController emailController = TextEditingController();

TextEditingController fullNameController = TextEditingController();

TextEditingController phoneController = TextEditingController();


var formState = GlobalKey<FormState>();

void Contactme_bottom_sheet(@required BuildContext context,@required double height,@required double width)
{
  showFlexibleBottomSheet(
    bottomSheetBorderRadius: BorderRadius.only( topLeft: Radius.circular(width/20),
      topRight: Radius.circular(width/20),),
    minHeight: 0,
    maxHeight: .5,
    bottomSheetColor: Colors.transparent,


    builder:(contextScrollController ,scrollController,
        double bottomSheetOffset,)=> Column(
      mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width/20),
                  topRight: Radius.circular(width/20),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        'Contact Me',
                        style: TextStyle(
                          color: ColorsManager.red,
                          fontSize: width/20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 25,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: height/7,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                        'assets/images/tantawy.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text('Mahmoud Moustafa Eltantawy',style: TextStyle(fontSize: width/30),),
                                        Text('Aga,Dk,Egypt',style: TextStyle(fontSize: width/30),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                final url = 'https://www.facebook.com/mahmoud.eltantawy.3990';
                                                Launch_link(url);
                                              },
                                              child: Container(
                                                height: height/15,
                                                width: width/7,
                                                child: Image.asset(
                                                  'assets/images/facebook.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                final url = 'https://www.linkedin.com/in/mahmoud-eltantawy-7b26321b1';
                                                Launch_link(url);
                                              },
                                              child: Container(
                                                height: height/15,
                                                width: width/7,
                                                child: Image.asset(
                                                  'assets/images/linkedIn_PNG9.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                final url = 'https://wa.me/+2001015876911';
                                                Launch_link(url);
                                              },
                                              child: Container(
                                                height: height/15,
                                                width: width/7,
                                                child: Image.asset(
                                                  'assets/images/whatsapp.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                final url = 'https://www.instagram.com/ma7moud_eltantawy_/?igshid=YmMyMTA2M2Y=';
                                                Launch_link(url);
                                              },
                                              child: Container(
                                                height: height/15,
                                                width: width/7,
                                                child: Image.asset(
                                                  'assets/images/instagram.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Mbutton(width: width, height: height, colors: [
                              ColorsManager.red,
                              Color.fromRGBO(255, 41, 41, 1.0),
                              Color.fromRGBO(255, 75, 75, 1),
                              Color.fromRGBO(255, 90, 90, 1),

                            ], txt: "Back", wid: Icon(IconBroken.Arrow___Left_2,color: Colors.white,), func: ()=>(){
                              Navigator.pop(context);
                            })

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ), context: context,
  );

}
Future<void>Launch_link(String link)async{
  var urlink=link;
  if(await canLaunch((urlink))){
    await launch (urlink);
  }
  else{
    await launch (urlink);
  }
}