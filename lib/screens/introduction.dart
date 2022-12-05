import 'package:flutter/material.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';
class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
      child:Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, size: 65, color: Colors.amber),
          const Text('This is a study app. You can use it as you want. If you understanda how this works you would be able to scale it'),
        AppCircleButton(
          onTap: () => null,
          child: const Icon(Icons.arrow_forward, size: 35,)
        )
        ],
      ),),)
    );
  }
}
