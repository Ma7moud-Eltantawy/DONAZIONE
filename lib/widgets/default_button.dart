import 'package:flutter/material.dart';

import '../core/manager/colors_manager.dart';
import '../core/theme/theme.dart';

class DefaultButton extends StatelessWidget {

  const DefaultButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 18,),
    this.margin,
    this.backgroundColor = ColorsManager.red,
    this.titleColor = Colors.white,
    this.elevation,
    this.displayChild = false,
    this.child,
  }) : super(key: key);

  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color titleColor;
  final double? elevation;
  final bool displayChild;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width/60),
      margin: margin,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(width/40)),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          elevation: MaterialStateProperty.all(elevation),
        ),
        onPressed: onPressed,
        child: displayChild
            ? child
            : Text(
                text,
                style: TextStyle(color: titleColor,fontWeight: FontWeight.bold,fontSize:width/25 ),
              ),
      ),
    );
  }
}
