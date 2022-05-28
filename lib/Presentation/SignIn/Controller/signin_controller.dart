import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../App/Controller/user_controller.dart';
import '../../../App/Resources/app_checkInputs.dart';
import '../../../App/Resources/app_utils.dart';
import '../../../App/Widget/laoding.dart';


class SignInController extends GetxController {

  final userNameInputText = TextEditingController();
  final passwordInputText = TextEditingController();
  bool showPassword = true;
  late FocusNode passwordFocusNode;
  //
  void initState() {
    passwordFocusNode = FocusNode().obs as FocusNode;
  }

  @override
  void dispose(){
    super.dispose();
    passwordFocusNode.dispose();
  }

  showPasswordState (){
    showPassword = !showPassword;
    update();
  }
  signInRequest(context){

    if(CheckInputs().checkLoginInput() == true){
      UserController().checkUser(context);
    }
    else{
      Loading().hideLoading(context);
      AppUtils().showSnack("Failure", "please review inputs");
    }
  }


}