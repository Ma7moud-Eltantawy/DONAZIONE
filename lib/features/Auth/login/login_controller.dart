import 'package:blood_donar/data/Data_source/auth_data_source.dart';
import 'package:blood_donar/features/Home/Home_Screen/Main_screen.dart';
import 'package:blood_donar/widgets/Motion_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../../../core/enums.dart';

class LoginController extends GetxController {
  final BaseAuthDataSource _remmoteDataSource = AuthRemoteDataSource();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  sendOTP()
  {
    //_remmoteDataSource.sendOTP(number: "+201015876911");
    update();
  }

  changeLoadingValue() {
    loading = !loading;
    update();
  }
  loginwithgoogle({required BuildContext ctx,required double height,required double width})
  async {
    await _remmoteDataSource.logout();
    _remmoteDataSource.loginwithgoogle().then((value) async {
      if (value.data!.idToken != null) {
        try{
          await saveUserInLocal(id:value.data!.idToken.toString());
          await Getdatafromlocal(id:value.data!.idToken.toString() );
          navigateUserAfterLoginSuccess(ctx: ctx);
        }
        catch(e) {
          _remmoteDataSource.logout();
          Fail_toast(ctx: ctx, title: "login failed", height: height, width: width, desc: "email is incorrect");
        }
    }
    });
    update();

  }


  navigateUserAfterLoginSuccess({required BuildContext ctx}) {
    Get.offAll(
          () =>  MainScreen(),
      transition: kTransition2,
      duration: kTransitionDuration,
    );
    Succes_toast(ctx: ctx, height: MediaQuery.of(ctx).size.height, width: MediaQuery.of(ctx).size.width, desc: "Login Succesed");
  }

  saveUserInLocal({required String id}) async{
    await _remmoteDataSource.Getuserdata(id:id ).then((value)async{
      await _remmoteDataSource.SaveuserinDB(user: value.data!);
    });
  }
  Getdatafromlocal({required String id}) async{
    await _remmoteDataSource.getuserfromDB().then((value) {
      _remmoteDataSource.Getuserdata(id:value.data!.id!);
    });

  }


  Future login({required BuildContext ctx,required double heidht, required double width}) async {
    changeLoadingValue();
    final result = await _remmoteDataSource.login(
      email: emailController.text.trim(),
      pass: passwordController.text,
    );
    if (result.requestState == RequestState.success) {
      if (result.data!.user != null) {
        await saveUserInLocal(id:result.data!.user!.uid.toString());
        await Getdatafromlocal(id:result.data!.user!.uid.toString() );
        navigateUserAfterLoginSuccess(ctx: ctx);
        changeLoadingValue();
      }
    } else if (result.requestState == RequestState.failed) {
      //snackBarError(result.errorMessage!);
      Fail_toast(ctx: ctx, title: "login failed", height: heidht, width: width, desc: "email or password is incorrect");
      changeLoadingValue();
    }
  }
}