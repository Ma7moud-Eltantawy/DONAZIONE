import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

void Succes_toast({required BuildContext ctx,required double height,required double width,required String desc,


})
{
  MotionToast.success(
    onClose: (){print(desc);},
    title: "Success",
    titleStyle: TextStyle(fontWeight: FontWeight.bold),
    description: desc,
    descriptionStyle: TextStyle(
      //overflow: TextOverflow.ellipsis,
    ),
    animationType: ANIMATION.FROM_LEFT,
    position: MOTION_TOAST_POSITION.TOP,
    borderRadius: 10.0,
    width: 300,
    height: 65,

  ).show(ctx);


}

void Fail_toast({required BuildContext ctx,required String title,required double height,required double width,required String desc,


})
{
  MotionToast.error(
    onClose: (){print(desc);},
    title: title,
    titleStyle: TextStyle(fontWeight: FontWeight.bold),
    description: desc,
    descriptionStyle: TextStyle(
      //overflow: TextOverflow.ellipsis,
    ),
    animationType: ANIMATION.FROM_LEFT,
    position: MOTION_TOAST_POSITION.TOP,
    borderRadius: 10.0,
    width: 300,
    height: 65,

  ).show(ctx);


}

