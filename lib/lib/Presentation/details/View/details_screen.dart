import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../App/Messages/app_messages.dart';
import '../../../App/Resources/app_colors.dart';
import '../../../App/Resources/app_texts_style.dart';
import '../../../App/Widget/header.dart';
import '../../Home/Controller/home_controller.dart';
import '../Controller/details_controller.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Header(username:Get.find<HomeController>().userName.value  ,image:Get.find<HomeController>().image.value,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),child:Column(
                children: [
                  Container(
                      width: Get.width-20,
                      decoration: const BoxDecoration(
                        color: AppColors.blueeColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Balance : ",style: headerTextStyle,),
                                Text(controller.userDetail.first.balance.toString(),style: headerTextStyle,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("age : ",style: headerTextStyle,),
                                Text(controller.userDetail.first.age.toString(),style: headerTextStyle,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("registered : ",style: headerTextStyle,),
                                Text(controller.userDetail.first.registered.toString(),style: headerTextStyle,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:Row(
                              children: [
                                Text("about : ",style: headerTextStyle,),
                                Expanded(child:   Text(controller.userDetail.first.about.toString(),style: headerTextStyle,maxLines: 2),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(child:SizedBox(

                                  child:  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(AppColors.green),
                                      overlayColor: MaterialStateProperty.all(AppColors.greenA),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: const BorderSide(color: AppColors.green),
                                        ),
                                      ),
                                    ),
                                    onPressed:() {

                                    },
                                    child:  Padding(padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(AppMessages.edit, style:headerTextStyle),
                                    ),
                                  ),
                                ),visible: Get.find<HomeController>().userName.value == controller.userDetail.first.username ? true : false,)
                              ],
                            ),
                          )
                        ],
                      ),)
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20,),child:   Row(
                  children: [
                    Text("Friends",style: headerDarkTextStyle,)
                  ],
                ),),
                  SizedBox(
                   width: Get.width,
                   height: 70,
                   child: friendList(context),
                 ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20,),child:    Row(
                    children: [
                      Text("greeting",style: headerDarkTextStyle,)
                    ],
                  ),),

                  Container(
                      width: Get.width-20,
                      decoration: const BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(controller.userDetail.first.greeting.toString(),textAlign: TextAlign.center,style: headerTextStyle,maxLines: 5,),)
                            ],
                          ),
                        ],
                      ),)
                  ),
                ],
              ),)
            ]),)//destination screen
    );
  }
  Widget friendList(context) {
    var items = controller.userDetail.first.friends;
    return  Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.blueColor)
        ),
        child:controller.userDetail.first.friends?.length== 0 ? Center(child: Text("You Dont Have any friends yet",style: headerDarkTextStyle,),) : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items?.length,
            itemBuilder:(context,index){
              return Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),child:Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration( color: AppColors.blueeColor,borderRadius: BorderRadius.all(Radius.circular(20)),),
                child: Center(
                  child: Text(items![index]["name"],textAlign: TextAlign.center, style:descriptionTextStyle),
                ),
              ));
            }));
  }
}

