import 'package:blood_donar/core/manager/colors_manager.dart';
import 'package:blood_donar/features/Auth/verfication/controller/ver_controller.dart';
import 'package:blood_donar/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/styles/Local_Styles.dart';
import '../../../../core/styles/icons.dart';



class Verfication extends StatefulWidget {
  const Verfication({Key? key}) : super(key: key);
  static const scid="verfiy";


  @override
  State<Verfication> createState() => _Verfication();
}

class _Verfication extends State<Verfication> {
  final  TextEditingController ? n1=TextEditingController();
  final  TextEditingController ? n2=TextEditingController();
  final  TextEditingController ? n3=TextEditingController();
  final  TextEditingController ? n4=TextEditingController();
  final  TextEditingController ? n5=TextEditingController();
  final  TextEditingController ? n6=TextEditingController();
  String txt="";
  verfication_controller controller=Get.put(verfication_controller());

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: GetBuilder<verfication_controller>(
        init: verfication_controller(),
        builder:(con)=> Scaffold(

          body: Stack(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width/13),
                child:  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter the verification code",style: TextStyle(
                          color: ColorsManager.red,

                          fontSize: width/20,
                          fontWeight: FontWeight.bold

                      ),),
                      Image.asset(
                        'assets/images/msg.png',
                        height: height/4,
                        fit: BoxFit.cover,
                      ),
                      Text("Enter the verification code sent",textDirection: TextDirection.rtl,style: TextStyle(
                          color: ColorsManager.blue,


                      ),),
                      SizedBox(
                        height: height/15,
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 4,
                        direction: Axis.horizontal,
                        runSpacing: 10,
                        children: [
                          _otpTextField(context, false,1,n1!),
                          _otpTextField(context, false,2,n2!),
                          _otpTextField(context, false,3,n3!),
                          _otpTextField(context, false,4,n4!),
                         // _otpTextField(context, false,5,n5!),
                          //_otpTextField(context, false,6,n6!),

                        ],
                      ),
                      SizedBox(
                        height: height/15,
                      ),
                      DefaultButton(onPressed: (){
                        con.sendOtp("");
                      }, text: "verification")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
  Widget _otpTextField(BuildContext context, bool autoFocus,int num,TextEditingController con) {
    return  Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(

          maxLength: 1,
          controller: con,
          autofocus: autoFocus,
          decoration: InputDecoration(
            counter: Offstage(),
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(),
          cursorColor: ColorsManager.red,
          maxLines: 1,
          onTap: (){

          },
          onChanged: (value) {
            setState(() {
              txt=n1!.text+n2!.text+n3!.text+n4!.text+n5!.text+n6!.text;
              print(txt);
            });

            print(value);
            if(value.length != 4&& num!=0) {


              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }
}
