
import 'package:get/get.dart';
import '../../Presentation/Home/View/Screen/home_screen.dart';
import '../../Presentation/SignIn/View/Screen/signin_screen.dart';
import '../../Presentation/Splash/View/splash_view.dart';
import '../../Presentation/details/View/details_screen.dart';
import 'app_routes.dart';

class Pages {
  static const initialRoute = Routes.splashScreen;

  static final List<GetPage> pages=[

      GetPage(transition: Transition.upToDown,name: Routes.splashScreen, page: () => const SplashScreen()),
      GetPage(transition: Transition.upToDown,name: Routes.signIn, page: () => const SignInScreen()),
      GetPage(transition: Transition.upToDown,name: Routes.home, page: () => const HomeScreen()),
      GetPage(transition: Transition.upToDown,name: Routes.details, page: () => const DetailsScreen()),

  ];
}
