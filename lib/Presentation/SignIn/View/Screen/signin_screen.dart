import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../App/Messages/app_messages.dart';
import '../../../../App/Resources/app_colors.dart';
import '../../../../App/Resources/app_sizes.dart';
import '../../Controller/signin_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset:false,
          body: Center(
            child:Container(
              width: Get.width,
              height: Get.height,
              color: AppColors.whiteColor,
              child: Stack(
                  children: [
                    header(),
                    inputsForm(context),
                  ]),
            ),
          ),
        ), onWillPop: () => Future(() => false));
  }

  Widget header(){
    return Padding(padding: const EdgeInsets.only(top: AppSizes.spaceTopHeaderSize),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(AppMessages.appNameTxt.tr, style: const TextStyle(fontFamily: AppSizes.textFontFamily, fontWeight: AppSizes.textWeight, color: AppColors.textBlackColor, fontSize: AppSizes.textHeaderSize)),
              Text(AppMessages.signInTxt.tr, style: const TextStyle(fontFamily: AppSizes.textFontFamily, fontWeight: AppSizes.textWeight, color: AppColors.textBlackColor, fontSize: AppSizes.textSubHeaderSize)),
            ]),
      ),
    );
  }
  Widget inputsForm(context){
    return Align(alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: Get.width,
        height: Get.height/1.4,
        child: SingleChildScrollView(
          child: Column(
              children: [
                email(),
                password(context),
                signInButton(context),
              ]),
        ),
      ),
    );
  }
  Widget email() {
    return Padding(padding: const EdgeInsets.only(top: AppSizes.spaceInputFieldSize),
      child: SizedBox(
        width: Get.width/1.7,
        child: Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: TextField(
              style: const TextStyle(color: AppColors.textBlackColor),
              controller: controller.userNameInputText,
              textAlign: TextAlign.left,
              cursorHeight: 27,
              cursorColor: AppColors.textBlackColor,
              decoration: InputDecoration(
                  suffixIcon:  const Icon(Icons.supervised_user_circle_rounded, color: AppColors.blueColor, size: AppSizes.iconSize),
                  fillColor: AppColors.textFieldBackColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.textFieldBackColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.textFieldBackColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.textFieldBackColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: AppMessages.userNameExp.tr,
                  hintStyle: const TextStyle(
                      color: AppColors.textHintColor,
                      fontWeight: AppSizes.textWeight,
                      fontFamily: AppSizes.textFontFamily, fontSize: AppSizes.textSize)),
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
            ),
          ),
        ),
      ),
    );
  }
  Widget password(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) => Padding(padding: const EdgeInsets.only(top: AppSizes.spaceInputFieldSize),
        child: SizedBox(
          width: Get.width/1.7,
          height: AppSizes.textFieldHeight,
          child: Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Stack(
                  children: [
                    TextField(
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(20),
                        FilteringTextInputFormatter.allow(RegExp("[A-Za-z!@#&_0-9]")),
                      ],
                      style: const TextStyle(color: AppColors.textBlackColor),
                      controller: controller.passwordInputText,
                      textAlign: TextAlign.left,
                      cursorHeight: 27,
                      cursorColor: AppColors.textBlackColor,
                      decoration: InputDecoration(
                          fillColor: AppColors.textFieldBackColor,
                          filled: true,
                          suffixIcon: InkWell(
                            child:  Icon(controller.showPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_sharp, color: AppColors.blueColor, size: AppSizes.iconSize),
                            onTap: () => controller.showPasswordState(),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFieldBackColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFieldBackColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textFieldBackColor, width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: AppMessages.passwordTxt.tr,
                          hintStyle: const TextStyle(
                              color: AppColors.textHintColor,
                              fontWeight: AppSizes.textWeight,
                              fontFamily: AppSizes.textFontFamily, fontSize: AppSizes.textSize)),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.showPassword,
                      autofocus: true,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
  Widget signInButton(context) {
    return Padding(padding: const EdgeInsets.only(top: AppSizes.spaceInputFieldSize),
      child: SizedBox(
        width: Get.width/1.8,
        height: AppSizes.buttonHeight,
        child:  ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.blueColor),
            overlayColor: MaterialStateProperty.all(AppColors.textLinkColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.blueColor),
              ),
            ),
          ),
          onPressed:() {
            controller.signInRequest(context);
          },
          child: const Padding(padding: EdgeInsets.only(bottom: 5),
            child: Text(AppMessages.signInTxt, style: TextStyle(fontWeight: AppSizes.textWeight, fontFamily: AppSizes.textFontFamily, color: AppColors.textWhiteColor, fontSize: AppSizes.textSize)),
          ),
        ),
      ),
    );
  }
}