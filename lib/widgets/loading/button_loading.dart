import 'package:flutter/material.dart';
import '../../core/manager/colors_manager.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      strokeWidth: 1,
      color: ColorsManager.primary,
    ));
  }
}
