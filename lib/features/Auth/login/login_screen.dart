import 'package:animate_do/animate_do.dart';
import 'package:blood_donar/features/Auth/Signup/Signup_screen/view/Signup_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants.dart';
import '../../../core/manager/colors_manager.dart';
import '../../../widgets/button_loading.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/m_button.dart';
import '../../../widgets/text_field.dart';
import 'login_controller.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'LOGIN',
          style: TextStyle(color: ColorsManager.red, fontSize: 16),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FadeIn(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                        height: height/5,
                        width: width,
                        child: SvgPicture.asset("assets/images/login.svg")
                    ),
                    CustomTextFormField(
                      lines: 1,
                      controller: controller.emailController,
                      label: 'Email',
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      lines: 1,
                      controller: controller.passwordController,
                      label: 'Password',
                      isPassword: true,
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GetBuilder<LoginController>(
                      builder: (cc) {
                        if (cc.loading) {
                          return const ButtonLoading();
                        } else {
                          return DefaultButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login(ctx: context,heidht: height,width: width);
                              }
                            },
                            text: 'Login',
                            titleColor: Colors.white,

                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    SizedBox(height: height/30,),
                    Container(
                        alignment: Alignment.center,

                        child:Row(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: [
                            SizedBox(
                              child: Container(
                                color: Colors.black26,
                              ),
                              width: width/4,
                              height: height/860,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/10),
                              child: Text("OR",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: width/25,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600
                              )
                              ),
                            ),
                            SizedBox(
                              child: Container(
                                color: Colors.black26,
                              ),
                              width: width/3,
                              height: height/860,
                            ),
                            SizedBox(width: width/35,),

                          ],
                        )
                    ),
                    SizedBox(height: height/30,),


                    GetBuilder<LoginController>(
                      builder:(con)=> Mbutton(width: width, height: height, colors: [Color.fromRGBO(242, 243, 245, 1),Color.fromRGBO(242, 243, 245, 1)], txt: "Login with Google account", wid: Image.asset('assets/images/google.png'),

                        func: ()=>(){
                          //controller.sendOTP();
                          controller.loginwithgoogle(ctx:context,height:height,width:width);
                        }

                      ,txtcolor: Colors.black54,),
                    ),
                    SizedBox(height: height/30,),
                    TextButton(
                      onPressed: () {
                        Get.to(
                              () => Signup_Screen(),
                          transition: kTransition1,
                          duration: kTransitionDuration,
                        );
                      },
                      child: const Text('create new account',style: TextStyle(color: ColorsManager.red),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
