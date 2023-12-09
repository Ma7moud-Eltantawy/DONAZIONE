import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/data/Data_source/auth_data_source.dart';
import 'package:email_auth/email_auth.dart';
import 'package:get/get.dart';
class verfication_controller extends GetxController
{


  Future<void> sendOtp(String recipientEmail) async {
    var remoteServerConfiguration = {"server" : "https://carvaan.herokuapp.com",
      "serverKey" : "UDujOQ",
    };

    EmailAuth emailAuth=EmailAuth(sessionName: "sample Session");
    await emailAuth.config(remoteServerConfiguration);
    var res=await emailAuth.sendOtp(recipientMail: recipientEmail);
    if(res)
      {
        print(res);
      }
    else{
      print("nullll");
    }

  }
  
  validate_otp({required String otp})
  {
    /*emailAuth!.validateOtp(
        recipientMail: "mahmoudeltantawy2019@gmail.com",
        userOtp: otp);*/
  }
  

}