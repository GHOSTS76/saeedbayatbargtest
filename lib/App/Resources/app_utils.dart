
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';


class AppUtils{

  showSnack(title,description){
    Get.snackbar(title, description,colorText: AppColors.blackColor,snackPosition: SnackPosition.BOTTOM,margin: const EdgeInsets.symmetric(vertical: 40,horizontal: 20));
  }
  checkEmpty(input){
    if(input== "" || input == null){
      return true;
    }else{
      return false;
    }
  }

  checkEmail(String input){
    if(input.contains("@") && input.contains(".com")){
      return true;
    }else{
      return false;
    }
  }
}