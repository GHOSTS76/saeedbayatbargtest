

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../Resources/app_colors.dart';

class Loading{
  late bool isLoading;
  showLoading(context){
    isLoading = true;
    Loader.show(context,
      isSafeAreaOverlay: true,
      isBottomBarOverlay: true,
      overlayFromBottom: 80,
      overlayColor: AppColors.black45,
      progressIndicator: const CircularProgressIndicator(backgroundColor: AppColors.whiteColor,color: AppColors.blueColor,),
    );
  }
  hideLoading(context){
    Loader.hide();
  }
}