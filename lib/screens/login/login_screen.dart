import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import '../../widgets/common/main_button.dart';

class LoginScreen extends GetView<AuthController>{
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          gradient: mainGradient(context)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_splash_logo.png', width: 200, height: 200,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:60),
              child: Text(
                'This is a study app. You can use as you want. You have the full acces to all the materials in this course '
              , style: TextStyle(
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold,
              ),
                  textAlign: TextAlign.center


              ),
            ),
            MainButton(
              onTap: ( ) {
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top:0,
                      bottom: 0,


                      child: SvgPicture.asset('assets/icons/google.svg')
                  ),
                  Center(
                    child: Text(
                      "Sign in with Google ",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}
