import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../App/Resources/app_colors.dart';

import '../../../App/Resources/app_texts_style.dart';
import '../Controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController>{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColors.whiteColor,
                AppColors.blueColor
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Text("Mohammad Saeed Bayat\n Barg Test",style: headerDarkTextStyle,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}