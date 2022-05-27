
import 'package:get/get.dart';

import '../../Presentation/Home/Controller/home_controller.dart';
import '../../Presentation/SignIn/Controller/signin_controller.dart';
import '../../Presentation/Splash/Controller/splash_controller.dart';
import '../../Presentation/details/Controller/details_controller.dart';
import '../Controller/user_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailsController());
  }
}