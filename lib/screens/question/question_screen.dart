// ignore_for_file: slash_for_doc_comments, unnecessary_import

/**
 * Start of my implementation replacing it with the actual implementation in the tutorial 
 * 
 * HA HA HA
**/
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_study_app/models/question_paper_model.dart';
// import 'package:get/get.dart';
// import 'package:flutter_study_app/configs/themes/app_icons.dart';

// import '../../configs/themes/app_colors.dart';
// import '../../configs/themes/custom_text_styles.dart';
// import '../../configs/themes/ui_parameters.dart';
// import 'answers_report.dart';

// class QuestionScreen extends StatefulWidget {
//   const QuestionScreen({Key? key}) : super(key: key);
//   static String routeName = "/questionScreen";
//   @override
//   State<QuestionScreen> createState() => _QuestionScreenState();
// }

// class _QuestionScreenState extends State<QuestionScreen> {
//   final PageController _pageController = PageController();
//   static const _kDuration = Duration(milliseconds: 300);
//   static const _kCurve = Curves.ease;
//   static const countdownDuration = Duration(minutes: 15);
//   Duration duration = Duration();
//   Timer? timer;
//   bool countDown = true;
//   var selectedAnswer = "";
//   final Map<int, String> _answersQuestionMap = {};
//   final Map<int, String> _actualAnswersQuestionMap = {};

//   void updateColor() {}
//   Widget buildQuestionPreview(Questions question, BuildContext context,
//       int numOfQuestions, QuestionPaperModel paper, String timerText) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: mainGradient(context),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [
//               // Top section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.white, width: 1)),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0, vertical: 4),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.timer,
//                             color: Colors.white,
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                             timerText,
//                             style: detailTextStyle.copyWith(
//                                 color: onSurfaceTextColor),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 4.0),
//                     child: Text(
//                       "Q 0${_currentIndex + 1}",
//                       style:
//                           detailTextStyle.copyWith(color: onSurfaceTextColor),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                             context: context,
//                             isDismissible: true,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return Container(
//                                 decoration:
//                                     BoxDecoration(gradient: mainGradientLight),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Center(
//                                       child: Text(
//                                         "Selected Answers and Question",
//                                         style: detailTextStyle.copyWith(
//                                             color: onSurfaceTextColor,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       '${_answersQuestionMap.keys.length} out of $numOfQuestions answered',
//                                       style: detailTextStyle.copyWith(
//                                           color: onSurfaceTextColor,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Container(
//                                         margin: EdgeInsets.all(5),
//                                         width: 160,
//                                         decoration: BoxDecoration(
//                                           color: Colors.transparent,
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8.0, vertical: 4),
//                                           child: Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.timer,
//                                                 color: Colors.white,
//                                               ),
//                                               SizedBox(
//                                                 width: 2,
//                                               ),
//                                               Text(
//                                                 "14:40",
//                                                 style: detailTextStyle.copyWith(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 14,
//                                                     color: onSurfaceTextColor),
//                                               ),
//                                               SizedBox(
//                                                 width: 6,
//                                               ),
//                                               Text("Remaining",
//                                                   style: detailTextStyle.copyWith(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 14,
//                                                       color:
//                                                           onSurfaceTextColor))
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     for (var key in _answersQuestionMap.keys)
//                                       Container(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 30),
//                                         margin: EdgeInsets.only(bottom: 10),
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                                 cardBorderRadius),
//                                             color: Theme.of(context).cardColor),
//                                         height: Get.width * 0.15,
//                                         width: Get.width * 0.855,
//                                         child: Center(
//                                             child: Text(
//                                           "Q${key + 1}. ${_answersQuestionMap[key]}",
//                                           style: headerTextStyle.copyWith(
//                                               color: customBlackColor,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16),
//                                         )),
//                                       ),
//                                     Spacer(
//                                       flex: 2,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         if (_answersQuestionMap.keys.length ==
//                                             numOfQuestions) {
//                                           Get.toNamed(AnswersReport.routeName,
//                                               arguments: {
//                                                 "answersMap":
//                                                     _actualAnswersQuestionMap,
//                                                 "usersAnswersMap":
//                                                     _answersQuestionMap,
//                                                 "questionModel": question,
//                                                 "paperModel": paper
//                                               });
//                                         } else {
//                                           print("You have not completed");
//                                         }
//                                       },
//                                       child: Container(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 30),
//                                         margin: EdgeInsets.only(bottom: 10),
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                                 cardBorderRadius),
//                                             color: Theme.of(context).cardColor),
//                                         height: Get.width * 0.15,
//                                         width: Get.width * 0.55,
//                                         child: Center(
//                                             child: Text(
//                                           "Complete",
//                                           style: headerTextStyle.copyWith(
//                                               color: customBlackColor,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16),
//                                         )),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             });
//                       },
//                       child: Icon(
//                         AppIcons.menuLeft,
//                         color: onSurfaceTextColor,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Spacer(
//                 flex: 2,
//               ),
//               Text(
//                 question.question,
//                 style: detailTextStyle.copyWith(
//                     color: onSurfaceTextColor, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               for (var ans in question.answers)
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _answersQuestionMap[_currentIndex] = ans.identifier!;
//                       _actualAnswersQuestionMap[_currentIndex] =
//                           question.correctAnswer!;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     margin: EdgeInsets.only(bottom: 5),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(cardBorderRadius),
//                         color: _answersQuestionMap.containsKey(_currentIndex)
//                             ? _answersQuestionMap[_currentIndex] ==
//                                     ans.identifier
//                                 ? activeColor
//                                 : inactiveColor
//                             : inactiveColor),
//                     height: Get.width * 0.15,
//                     width: Get.width * 0.855,
//                     child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("${ans.identifier}. ${ans.answer}",
//                             style: detailTextStyle.copyWith(
//                                 color: customBlackColor,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500))),
//                   ),
//                 ),
//               Spacer(
//                 flex: 2,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         prevFunction();
//                       },
//                       child: containerButton(context, "Back"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         if (_currentIndex == numOfQuestions) {
//                           print("Num of questions");
//                         }
//                         nextFunction();
//                       },
//                       child: containerButton(context, "Next"),
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }

//   Container containerButton(BuildContext context, String text) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       margin: EdgeInsets.only(bottom: 5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(cardBorderRadius),
//           color: Theme.of(context).cardColor),
//       height: Get.width * 0.15,
//       width: Get.width * 0.855,
//       child: Center(
//           child: Text(
//         text,
//         style: headerTextStyle.copyWith(
//             color: customBlackColor, fontWeight: FontWeight.bold, fontSize: 16),
//       )),
//     );
//   }

//   int _currentIndex = 0;
//   _onChangedFunction(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   void nextFunction() {
//     _pageController.nextPage(duration: _kDuration, curve: _kCurve);
//   }

//   void prevFunction() {
//     _pageController.previousPage(duration: _kDuration, curve: _kCurve);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var paper = Get.arguments as QuestionPaperModel;
//     var time = buildTimeText();
//     return PageView(
//       controller: _pageController,
//       // physics: NeverScrollableScrollPhysics(),
//       onPageChanged: _onChangedFunction,
//       children: [
//         for (var q in paper.questions!)
//           buildQuestionPreview(q, context, paper.questions!.length, paper, time)
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     reset();
//     startTimer();
//   }

//   void reset() {
//     if (countDown) {
//       setState(() {
//         duration = countdownDuration;
//       });
//     } else {
//       setState(() {
//         duration = Duration();
//       });
//     }
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
//   }

//   void addTime() {
//     final addSeconds = countDown ? -1 : 1;
//     setState(() {
//       final seconds = duration.inSeconds + addSeconds;
//       if (seconds < 0) {
//         timer?.cancel();
//       } else {
//         duration = Duration(seconds: seconds);
//       }
//     });
//   }

//   void stopTimer({bool resets = true}) {
//     if (resets) {
//       reset();
//     }
//     setState(() {
//       timer?.cancel();
//     });
//   }

//   String buildTimeText() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$hours:$minutes:$seconds';
//   }
// }

// enum SwitchableColors { active, inactive }

// Color activeColor = Colors.white60;
// Color inactiveColor = Colors.white;

/**
 * End of my implementation replacing it with the actual implementation in the tutorial 
 * 
 * HA HA HA
**/

import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/screens/question/test_overview_screen.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/common/question_place_holder.dart';
import 'package:flutter_study_app/widgets/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/questions/answer_card.dart';
import 'package:flutter_study_app/widgets/questions/countdown_timer.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/controllers/question_paper/questions_controller.dart';

import '../../widgets/common/background_decoration.dart';
import '../../widgets/content_area.dart';

class QuestionScreen extends GetView<QuestionsController> {
  // lets our view know about the controller
  const QuestionScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // nice touch
        appBar: CustomAppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Obx(() => CountdownTimer(
                  time: controller.time.value,
                  color: onSurfaceTextColor,
                )),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
          ),
          showActionIcon: true,
          titleWidget: Obx(() => Text(
                "Q.${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
                style: appBarTS,
              )),
        ),
        body: BackgroundDecoration(
          child: Obx(
            (() => Column(
                  children: [
                    if (controller.loadingStatus.value == LoadingStatus.loading)
                      const Expanded(
                          child: ContentArea(child: QuestionScreenHolder())),
                    if (controller.loadingStatus.value ==
                        LoadingStatus.completed)
                      Expanded(
                        child: ContentArea(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Text(
                                  controller.currentQuestion.value!.question,
                                  style: questionTS,
                                ),
                                GetBuilder<QuestionsController>(
                                  // Specify what type of controller is being reacted to, so we can hook into its state and underlying methods
                                  id: "answers_list",
                                  builder: (controller) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.only(top: 25),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: ((context, index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                          isSelected: answer.identifier ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                          answer:
                                              "${answer.identifier}. ${answer.answer}",
                                          onTap: () {
                                            controller.selectedAnswer(
                                                answer.identifier);
                                          },
                                        );
                                      }),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 10,
                                      ),
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParameters.mobileScreenPadding,
                        child: Row(
                          children: [
                            Visibility(
                                visible: controller.isFirstQuestion,
                                child: SizedBox(
                                  width: 55,
                                  height: 55,
                                  child: MainButton(
                                    onTap: () {
                                      controller.prevQuestion();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Get.isDarkMode
                                          ? onSurfaceTextColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )),
                            Expanded(
                              child: Visibility(
                                  visible: controller.loadingStatus.value ==
                                      LoadingStatus.completed,
                                  child: MainButton(
                                    onTap: () {
                                      controller.isLastQuestion
                                          ? Get.toNamed(
                                              TestOverviewScreen.routeName)
                                          : controller.nextQuestion();
                                    },
                                    title: controller.isLastQuestion
                                        ? 'Complete'
                                        : 'Next',
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
