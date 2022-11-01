import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  @override
  void onReady() {
    // allows to grab objects passed when we navigate to any view that has access to this controller (The route argument we pass in the question_controller when we navigate to the QuestionScreen)

    final _questionPaper = Get.arguments
        as QuestionPaperModel; // We perfom a cast to cast the data
    print(_questionPaper.id);
    loadData(_questionPaper);
    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();
      final questions = questionQuery.docs
          .map((snapshot) => QuestionPaperModel.fromSnapshot(snapshot))
          .toList(); // Get all the docs
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
