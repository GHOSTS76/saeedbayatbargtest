import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'App/Binding/bindings.dart';
import 'App/Resources/app_colors.dart';
import 'App/Routes/app_pages.dart';

Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainApp.changeTopColor(AppColors.blueColor,Brightness.light);
    return GetMaterialApp(
      title: 'BargTest',
      initialRoute: Pages.initialRoute,
      getPages: Pages.pages,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
    );
  }
  static void changeTopColor(Color color,Brightness brightness){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color,statusBarIconBrightness: brightness));
  }
}
