import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(() => ListView.separated(
          padding: UIParameters.mobileScreenPadding,
          itemBuilder: (BuildContext context, index) {
            return QuestionCard(
              model: _questionPaperController.allPapers[index],
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: _questionPaperController.allPapers.length)),
    );
  }
}
