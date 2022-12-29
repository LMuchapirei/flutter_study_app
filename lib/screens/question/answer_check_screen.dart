import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_app/screens/question/result_screen.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/widgets/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/questions/answer_card.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/controllers/question_paper/questions_controller.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);
  static const String routeName = "/answerCheck";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
        titleWidget: Obx(() => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: appBarTS,
            )),
      ),
      body: BackgroundDecoration(
        child: Obx(() => Column(
              children: [
                Expanded(
                    child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                        GetBuilder<QuestionsController>(
                          id: 'answer_review_list', // let us tell get to only update this section of the UI
                          builder: (_) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: controller
                                  .currentQuestion.value!.answers.length,
                              itemBuilder: (_, index) {
                                final answer = controller
                                    .currentQuestion.value!.answers[index];
                                final selectedAnswer = controller
                                    .currentQuestion.value!.selectedAnswer;
                                final correctAnswer = controller
                                    .currentQuestion.value!.correctAnswer;
                                final String answerText =
                                    '${answer.identifier}. ${answer.answer}';
                                if (correctAnswer == selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  // correct answer
                                  return CorrectAnswer(answer: answerText);
                                } else if (selectedAnswer == null) {
                                  // not selected an answer
                                  return NotAnswered(
                                    answer: answerText,
                                  );
                                } else if (correctAnswer != selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  // wrong answer picked
                                  return WrongAnswer(
                                    answer: answerText,
                                  );
                                } else if (correctAnswer == answer.identifier) {
                                  //correct answer
                                  return CorrectAnswer(
                                    answer: answerText,
                                  );
                                }

                                return AnswerCard(
                                    answer: answerText,
                                    isSelected: false,
                                    onTap: () {});
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
