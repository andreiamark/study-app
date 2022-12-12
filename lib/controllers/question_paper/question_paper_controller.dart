import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/services/firebase_storage_service.dart';

import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';
import '../auth_controller.dart';

class QuestionPaperController extends GetxController{
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void>getAllPapers() async {
    List<String> imgName = ['biology', 'chemistry', 'maths', 'physics'];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for(var paper in paperList) {
      final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
      paper.imageUrl =imgUrl;
      allPaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({
    required QuestionPaperModel paper, bool tryAgain = false}){
    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain) {
        Get.back();
       // Get.offNamed();
    } else {
        print('logged in');
        //Get.toNamed();
      }
    } else {
      print('title is ${paper.title}');
      _authController.showLoginAlertDialogue();
    }

  }
}