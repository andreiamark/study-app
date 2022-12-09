import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/screens/home/menu_screen.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:study_app/widgets/content_area.dart';
import '../../configs/themes/app_icons.dart';


class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return ZoomDrawer(
          borderRadius: 50.0,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          drawerShadowsBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width * 0.4,
          controller: _.zoomDrawerController,
          menuScreen: MyMenuScreen(),
              mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient(context)),
              child: SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ElevatedButton(
                     onPressed: controller.toggleDrawer,
                     child: Icon(AppIcons.menuLeft, color: Colors.red,),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                      children: [
                    Icon(AppIcons.peace, color: Colors.red,),
                    Text(
                  "Hello friend",
                  style: detailText.copyWith(
                  color: onSurfaceTextColor
                  ),
              )
              ],
              ),
              ),
                Text(
                "What do you want to learn today?",
                style: headerText,
                    )
                    ],
                  ),
                 ),
                Expanded(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ContentArea(
                  addPadding: false,
                  child: Obx(() => ListView.separated(
                  padding: UIParameters.mobileScreenPadding,
                  shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                   return QuestionCard(
              model: _questionPaperController.allPapers[index],
              );
              },
              separatorBuilder: (BuildContext context, int index){
                   return SizedBox(height: 20,);
              },
              itemCount: _questionPaperController.allPaperImages.length),
              ),


              ),
              ))
              ],
              ))
              ),
        );
      },),
    );
  }
}
