import 'package:animate_do/animate_do.dart';
import 'package:blood_donar/core/constants.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/controller/Signup_Controller.dart';
import 'package:blood_donar/features/Auth/Signup/blood_group/view/blood_group.dart';
import 'package:blood_donar/features/Auth/login/login_screen.dart';
import 'package:blood_donar/features/maps/controller/mapcontroller.dart';
import 'package:blood_donar/features/maps/view/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../core/manager/colors_manager.dart';
import '../../../../../widgets/button_loading.dart';
import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/text_field.dart';
import '../../../login/login_controller.dart';
class Signup_Screen extends StatelessWidget  {
   Signup_Screen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final signup_Controller controller = Get.put(signup_Controller());


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0,1.0),
                  child:Container(
                    child: Image.asset('assets/images/Rectangle 5.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/15,vertical: height/80),
                        child: Text('Signup for a new account',style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 10),textDirection: TextDirection.ltr,)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/15),
                        child: Text('Create Account',style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 24),textDirection: TextDirection.ltr,)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/15,vertical: height/80),
                        child: Text('Enter your account details',style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 10),textDirection: TextDirection.ltr,)),
                  ],
                ),
              ],
            ),

            Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width/20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: FadeIn(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextFormField(

                            lines: 1,
                            controller: controller.nameController,
                            label: 'FULL NAME',
                            requiredField: true,
                          ),
                          SizedBox(
                            height: width/25,
                          ),
                          CustomTextFormField(
                            lines: 1,
                            controller: controller.emailController,
                            label: 'EMAIL',
                            requiredField: true,
                          ),
                          SizedBox(
                            height: width/25,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            lines: 1,
                            controller: controller.phonecontroller,
                            label: 'PHONE',
                            requiredField: true,
                            isPassword: false,

                          ),
                          SizedBox(
                            height: width/25,
                          ),
                          CustomTextFormField(
                            lines: 1,
                            controller: controller.passwordController,
                            label: 'PASSWORD',
                            isPassword: true,
                            requiredField: true,
                          ),
                          SizedBox(
                            height: width/20,
                          ),
                        DefaultButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //controller.login();
                             controller.CreatenewAccount();

                            }
                          },
                          text: 'Continue',
                          titleColor: Colors.white,

                        ),
                          TextButton(
                            onPressed: () {
                              Get.to(
                              () => LoginScreen(),
                          transition: kTransition1,
                          duration: kTransitionDuration,
                        );
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text('Already have an account? ',textDirection:TextDirection.ltr,style: TextStyle(color: ColorsManager.black),),
                                InkWell(
                                    onTap: (){
                                      Get.to(LoginScreen(),transition: kTransition2,duration: kTransitionDuration);
                                    },
                                    child: Text('Login',style: TextStyle(color: ColorsManager.red),)),

                              ],
                            ),
                          ),


                         /* CustomTextFormField(
                            lines: 1,
                            controller: controller.nameController,
                            label: 'الاسم بالكامل',
                            requiredField: true,
                          ),
                           SizedBox(
                            height: width/25,
                          ),
                          CustomTextFormField(
                            lines: 1,
                            controller: controller.emailController,
                            label: 'البريد الالكتروني',
                            requiredField: true,
                          ),
                           SizedBox(
                            height: width/25,
                          ),
                          CustomTextFormField(
                            lines: 1,
                            controller: controller.passwordController,
                            label: 'كلمة المرور',
                            requiredField: true,
                            isPassword: true,
                          ),
                           SizedBox(
                            height: width/25,
                          ),
                          CustomTextFormField(
                            lines: 1,
                            controller: controller.confirmpasswordController,
                            label: 'تأكيد كلمة المرور',
                            isPassword: true,
                            requiredField: true,
                          ),
                           SizedBox(
                            height: width/20,
                          ),
                          GetBuilder<LoginController>(
                            builder: (cc) {
                              if (cc.loading) {
                                return const ButtonLoading();
                              } else {
                                return DefaultButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      //controller.login();
                                    }
                                  },
                                  text: 'إستمرار',
                                  titleColor: Colors.white,

                                );
                              }
                            },
                          ),

                          TextButton(
                            onPressed: () {
                              /*Get.to(
                              () => Signupscreen(),
                          transition: kTransition1,
                          duration: kTransitionDuration,
                        );*/
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('لديك حساب بالفعل ؟',style: TextStyle(color: ColorsManager.primary),),
                                InkWell(
                                    onTap: (){

                                    },
                                    child: Text('تسجيل الدخول',style: TextStyle(color: ColorsManager.red),)),
                              ],
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
