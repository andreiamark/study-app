import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/screens/introduction.dart';

import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
 static List<GetPage> routes() => [
  GetPage(name: "/", page: () => SplashScreen()),
  GetPage(name:"/introduction", page:() => AppIntroductionScreen()),
  GetPage(
   name: '/home',
   page: () => const HomeScreen(),
   binding: BindingsBuilder(() {
    Get.put(QuestionPaperController());
   })
  )
 ];


}