import 'package:flutter/material.dart';
import 'package:study_app/data_uploader_screen.dart';
import 'package:study_app/routes/app_routes.dart';
import 'package:study_app/screens/introduction.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'bindings/initial_binding.dart';
import 'configs/themes/app_dark_theme.dart';
import 'configs/themes/app_light_theme.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes()
    );
  }
}

// Future<void>main() async{
//    WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }

