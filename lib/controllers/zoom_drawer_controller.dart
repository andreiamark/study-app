import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
class MyZoomDrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
  }
  void toggleDrawer() {
  zoomDrawerController.toggle?.call();
  update();
  }
}
void signOut() {

}

void signIn() {

}

void website() {

}

void email() {
 final Uri emailaunchUri = Uri(
    scheme: "mailto",
    path: "info@dbsetech.com"
  );
  _launch(emailaunchUri.toString());
}

Future <void>_launch(String url) async {
      if(!await launch(url)) {
        throw "could not launch $url";
      }
}