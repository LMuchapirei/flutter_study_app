import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/widgets/dialogs/dialog_widget.dart';
import 'package:get/get.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';

// Was my work
class AnswersReport extends StatelessWidget {
  const AnswersReport({Key? key}) : super(key: key);
  static String routeName = "/answersReport";
  @override
  Widget build(BuildContext context) {
    var resulstMap = Get.arguments as Map<String, dynamic>;
    var usersAnswerMap = resulstMap["answersMap"] as Map<int, String>;
    var actualQuestionsAMap = resulstMap["usersAnswersMap"] as Map<int, String>;
    var paperModel = resulstMap["paperModel"] as QuestionPaperModel;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding - 20),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                      "${correctAnswers(usersAnswerMap, actualQuestionsAMap)} out of ${actualQuestionsAMap.keys.length} where correct",
                      style: TextStyle(
                          color: onSurfaceTextColor,
                          fontWeight: FontWeight.bold))),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ContentArea(
                      child: ListView.separated(
                padding: UIParameters.mobileScreenPadding,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      var currentQuestion = paperModel.questions![index];
                      Get.dialog(Dialogs.correctAnswerDialog(
                        answer: currentQuestion.answers
                            .where((element) =>
                                element.identifier ==
                                currentQuestion.correctAnswer)
                            .first
                            .answer!,
                        question: currentQuestion.question,
                        onTap: () {
                          Get.back();
                        },
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cardBorderRadius),
                          color: Theme.of(context).cardColor),
                      height: Get.width * 0.15,
                      width: Get.width * 0.85,
                      child: Center(
                          child: Row(
                        children: [
                          usersAnswerMap[index] == actualQuestionsAMap[index]
                              ? Icon(
                                  Icons.check_circle,
                                  color: colorLightGreen,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.close_outlined,
                                  color: colorLightRed,
                                  size: 30,
                                ),
                          Text(
                            "Q${index + 1}. ${usersAnswerMap[index]} correctAnswer is ${actualQuestionsAMap[index]}",
                            style: headerTextStyle.copyWith(
                                color: customBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      )),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: usersAnswerMap.keys.length,
              )))
            ]),
          ),
        ),
      ),
    );
  }

  int correctAnswers(Map<int, String> usersAnswerMap, actualQuestionsAMap) {
    var correct = 0;
    for (var key in usersAnswerMap.keys) {
      if (usersAnswerMap[key] == actualQuestionsAMap[key]) {
        correct++;
      }
    }
    return correct;
  }

  Widget buildSuccessCard() {
    return Column(
      children: [],
    );
  }
}
