import 'package:flutter/cupertino.dart';

class Campain_item_model{
  Campain_item_model(
      {
        required this.Title,
        required this.img,
        required this.func,

      }
      );
  final String Title;
  final String img;
  final Function func;
}