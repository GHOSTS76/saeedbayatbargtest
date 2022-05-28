

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../App/Resources/app_colors.dart';
import '../../../../App/Resources/app_texts_style.dart';
import '../../../../App/Widget/header.dart';
import '../../../Splash/Controller/splash_controller.dart';
import '../../Controller/home_controller.dart';
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(child: Column(
              children: [
                Header(username:Get.find<HomeController>().userName.value,image:Get.find<HomeController>().image.value,),
                Expanded(child:   usersList(context),)
              ]),)//destination screen
        ), onWillPop: () => Future(() => false));
  }

  Widget usersList(context) {
    var items = Get.find<SplashController>().usersList;
    return Theme(data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.blueColor)),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder:(context,index){
                return Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),child:InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blueeColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: const EdgeInsets.symmetric(vertical:10,horizontal: 10),child:    Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: items[index].picture.toString(),
                              imageBuilder: (context, imageProvider) => CircleAvatar(backgroundImage:imageProvider,maxRadius: 26,),
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const CircleAvatar(backgroundColor: AppColors.whiteColor,foregroundImage: AssetImage("assets/user.png"),),
                            ),
                          //  CircleAvatar(backgroundImage:NetworkImage(items[index].picture.toString()),maxRadius: 26,),
                            Padding(padding: const EdgeInsets.only(left:10),child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: const EdgeInsets.symmetric(vertical: 5),child:Text(items[index].name.toString(),style: descriptionTextStyle,),),
                                Text(items[index].email.toString(),style: descriptionTextStyle,),
                              ],
                            ))
                          ],
                        ),),

                        Padding(padding: const EdgeInsets.symmetric(vertical:10,horizontal: 10),child: Text(items[index].address.toString(),style: descriptionTextStyle,),)
                      ],
                    ),
                  ),
                  onTap: (){

                   controller.itemDetails(items[index]);
                  },
                ));
              }));
  }
}

