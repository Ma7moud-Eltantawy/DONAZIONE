import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    // fontFamily: FontFamilies.kufam,
    fontSize: fontSize,
  );
}


// light
getLightStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w300,
    fontSize: fontSize,
  );
}

// regular
getRegularStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.normal,
    fontSize: fontSize,
  );
}

// medium
getMediumStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
  );
}

// SemiBold
getSemiBoldStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
  );
}

// Bold
getBoldStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w800,
    fontSize: fontSize,
  );
}

