import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(() => ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: FadeInImage(
                    placeholder:
                        AssetImage("assets/images/app_splash_logo.png"),
                    image: NetworkImage(
                        _questionPaperController.allPaperImages[index])),
              ),
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: _questionPaperController.allPaperImages.length)),
    );
  }
}
