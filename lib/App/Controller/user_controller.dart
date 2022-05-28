
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Presentation/Home/Controller/home_controller.dart';
import '../../Presentation/SignIn/Controller/signin_controller.dart';
import '../../Presentation/Splash/Controller/splash_controller.dart';
import '../Resources/app_utils.dart';
import '../Routes/app_routes.dart';
import '../Widget/laoding.dart';


class UserController extends GetxController {

  setLogState(user,image,context) async {
    var prefs = await SharedPreferences.getInstance();
    Get.find<HomeController>().userName.value = user;
    Get.find<HomeController>().image.value = image;
    prefs.setBool("isLoggedIn",true);
    prefs.setString("username",user);
    prefs.setString("image",image);
    Loading().hideLoading(context);
    Get.toNamed(Routes.home);
  }
  getLogState() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      if(prefs.getBool("isLoggedIn") == null){
        return false;
      }else{
        Get.find<HomeController>().userName.value =  prefs.getString("username")!;
        Get.find<HomeController>().image.value =  prefs.getString("image")!;
        return prefs.getBool("isLoggedIn");
      }

    }catch(err){
      debugPrint(err.toString());
    }

  }
  checkUser(context){
   var userName= Get.find<SignInController>().userNameInputText.text;
   var password= Get.find<SignInController>().passwordInputText.text;
    Loading().showLoading(context);
  var users =  Get.find<SplashController>().usersList;

    for(var counter=0;counter<users.length;counter++){
      if(users[counter].username == userName){
        if(users[counter].password==password){
          setLogState(userName,users[counter].picture,context);
          break;
        }else{
          Loading().hideLoading(context);
          AppUtils().showSnack("Failure", "your Password Is Wrong");
        }
      }else{
      if(counter+1 == users.length){
        AppUtils().showSnack("Failure", "your userName doesn't exist");
        Loading().hideLoading(context);
      }
      }
    }
  }
}
