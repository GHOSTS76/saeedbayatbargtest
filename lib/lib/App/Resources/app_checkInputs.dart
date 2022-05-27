
import 'package:get/get.dart';

import '../../Presentation/SignIn/Controller/signin_controller.dart';
import 'app_utils.dart';


class CheckInputs{

  checkLoginInput(){
    var loginInputs = Get.find<SignInController>();
    if(AppUtils().checkEmpty(loginInputs.userNameInputText.text) == false &&
       AppUtils().checkEmpty(loginInputs.passwordInputText.text) == false){
      return true;
    }else{
      return false;
    }
  }

}