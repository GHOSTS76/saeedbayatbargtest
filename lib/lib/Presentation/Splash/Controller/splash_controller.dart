import 'package:get/get.dart';
import '../../../App/Controller/user_controller.dart';
import '../../../App/Routes/app_routes.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../Domain/Models/users_model.dart';
class SplashController extends GetxController {
  RxList<Users> usersList = <Users>[].obs;
  @override
  void onInit() {

    initialData();
    super.onInit();
  }


  initialData () async {
    await loadJsonData();
    Future.delayed(const Duration(seconds: 2));
    if(await UserController().getLogState()){
      Get.toNamed(Routes.home);
    }else{
      Get.toNamed(Routes.signIn);
    }
  }
  loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/userprofiles.json');
    var data = json.decode(jsonText);

    for(var counter=0;counter<data.length;counter++){
        usersList.add(Users(
        username: data[counter]["username"],
        password: data[counter]["password"],
        name: data[counter]["name"],
        email: data[counter]["email"],
        address: data[counter]["address"],
        balance: data[counter]["balance"],
        registered: data[counter]["registered"],
        about: data[counter]["about"],
        greeting: data[counter]["greeting"],
        friends: data[counter]["friends"],
        favoriteFruit: data[counter]["favoriteFruit"],
        age: data[counter]["age"],
        picture: data[counter]["picture"],
      ));
    }
  }
}