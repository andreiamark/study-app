import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:study_app/controllers/app_logger.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();
 Rxn<User?> user = Rxn();



  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }
  void toggleDrawer() {
  zoomDrawerController.toggle?.call();
  update();
  }
}
void signOut() {
 Get.find<AuthController>().signOut();
}

void signIn() async {

}

void website() {
 _launch('https://www.google.com');
}

void facebook() {

}

void email() {
 final Uri emailaunchUri = Uri(
    scheme: "mailto",
    path: "markovicanandrea.com"
  );
  _launch(emailaunchUri.toString());
}

Future <void>_launch(String url) async {
      if(!await launch(url)) {
        throw "could not launch $url";
      }
}