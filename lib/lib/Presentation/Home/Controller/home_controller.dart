import 'package:get/get.dart';
import '../../../App/Routes/app_routes.dart';
import '../../../Domain/Models/users_model.dart';
import '../../details/Controller/details_controller.dart';
class HomeController extends GetxController {
  RxString userName ="".obs;
  RxString image ="".obs;

  itemDetails(item){
    Get.find<DetailsController>().userDetail.clear();
    Get.find<DetailsController>().userDetail.add(
        Users(
          username: item.username,
          password: item.password,
          name: item.name,
          email: item.email,
          address: item.address,
          balance: item.balance,
          registered:item.registered,
          about: item.about,
          greeting:item.greeting,
          friends: item.friends,
          favoriteFruit:item.favoriteFruit,
          age: item.age,
          picture:item.picture,
        )
    );
    Get.toNamed(Routes.details);
  }
}