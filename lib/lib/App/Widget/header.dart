import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Resources/app_colors.dart';
import '../Resources/app_texts_style.dart';

class Header extends StatefulWidget {

  const Header({final Key? key, required this.image, required this.username,}) : super(key: key);

  @override
  HeaderWidget createState() => HeaderWidget();

  final String? image;
  final String? username;

}

class HeaderWidget extends State<Header> {
  @override
  Widget build(final BuildContext context) {
    return   Material(
      elevation: 5,
      child:  Container(width: Get.width,height: 80,color: AppColors.blueColor,child: Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 15),child:  CircleAvatar(backgroundImage:NetworkImage(widget.image.toString()),maxRadius: 26,),),
          Padding(padding: const EdgeInsets.only(left:10),child: Text(widget.username.toString(),style: descriptionTextStyle,),)
        ],
      ),),
    );
  }
}