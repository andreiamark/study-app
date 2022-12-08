import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

import 'home/home_screen.dart';
class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
      child:Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, size: 65,),

          SizedBox(
            height:40 ,
          ),
          const Text(
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
              color: onSurfaceTextColor
            ),
              'This is a study app. You can use it as you want. If you understanda how this works you would be able to scale it'),
        AppCircleButton(
          onTap: () =>
            Get.offAndToNamed("/home"),
          child: const Icon(Icons.arrow_forward, size: 35,)
        ),
          TextButton(
              onPressed: () => Get.offAndToNamed("/home"),
              child: Text('aa'))
        ],
      ),),)
    );
  }
}
