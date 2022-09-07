import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../../screens/question/question_screen.dart';

class QuizPaperController extends GetxController {
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestion(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      Get.toNamed(QuestionScreen.routeName, arguments: paper);

      if (tryAgain) {
        // Get.back();
        // Get.offNamed();
      } else {
        // Get.toNamed();
      }
    } else {
      print('Title is ${paper.title}');
      _authController.showLoginAlertDialog();
    }
  }
}
