import 'package:flutter/material.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/configs/themes/app_icons.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import 'answers_report.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  static String routeName = "/questionScreen";
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final PageController _pageController = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  var selectedAnswer = "";
  final Map<int, String> _answersQuestionMap = {};
  final Map<int, String> _actualAnswersQuestionMap = {};
  void updateColor() {}
  Widget buildQuestionPreview(Questions question, BuildContext context,
      int numOfQuestions, QuestionPaperModel paper) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: mainGradient(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              // Top section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "14:40",
                            style: detailTextStyle.copyWith(
                                color: onSurfaceTextColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      "Q 0${_currentIndex + 1}",
                      style:
                          detailTextStyle.copyWith(color: onSurfaceTextColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                decoration:
                                    BoxDecoration(gradient: mainGradientLight),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        "Selected Answers and Question",
                                        style: detailTextStyle.copyWith(
                                            color: onSurfaceTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${_answersQuestionMap.keys.length} out of $numOfQuestions answered',
                                      style: detailTextStyle.copyWith(
                                          color: onSurfaceTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        width: 160,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.timer,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "14:40",
                                                style: detailTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: onSurfaceTextColor),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text("Remaining",
                                                  style: detailTextStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color:
                                                          onSurfaceTextColor))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    for (var key in _answersQuestionMap.keys)
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                cardBorderRadius),
                                            color: Theme.of(context).cardColor),
                                        height: Get.width * 0.15,
                                        width: Get.width * 0.855,
                                        child: Center(
                                            child: Text(
                                          "Q${key + 1}. ${_answersQuestionMap[key]}",
                                          style: headerTextStyle.copyWith(
                                              color: customBlackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )),
                                      ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_answersQuestionMap.keys.length ==
                                            numOfQuestions) {
                                          Get.toNamed(AnswersReport.routeName,
                                              arguments: {
                                                "answersMap":
                                                    _actualAnswersQuestionMap,
                                                "usersAnswersMap":
                                                    _answersQuestionMap,
                                                "questionModel": question,
                                                "paperModel": paper
                                              });
                                        } else {
                                          print("You have not completed");
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                cardBorderRadius),
                                            color: Theme.of(context).cardColor),
                                        height: Get.width * 0.15,
                                        width: Get.width * 0.55,
                                        child: Center(
                                            child: Text(
                                          "Complete",
                                          style: headerTextStyle.copyWith(
                                              color: customBlackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Icon(
                        AppIcons.menuLeft,
                        color: onSurfaceTextColor,
                      ),
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                question.question,
                style: detailTextStyle.copyWith(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              for (var ans in question.answers)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _answersQuestionMap[_currentIndex] = ans.identifier!;
                      _actualAnswersQuestionMap[_currentIndex] =
                          question.correctAnswer!;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorderRadius),
                        color: _answersQuestionMap.containsKey(_currentIndex)
                            ? _answersQuestionMap[_currentIndex] ==
                                    ans.identifier
                                ? activeColor
                                : inactiveColor
                            : inactiveColor),
                    height: Get.width * 0.15,
                    width: Get.width * 0.855,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("${ans.identifier}. ${ans.answer}",
                            style: detailTextStyle.copyWith(
                                color: customBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
              Spacer(
                flex: 2,
              ),
              GestureDetector(
                onTap: () {
                  nextFunction();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cardBorderRadius),
                      color: Theme.of(context).cardColor),
                  height: Get.width * 0.15,
                  width: Get.width * 0.855,
                  child: Center(
                      child: Text(
                    "Next",
                    style: headerTextStyle.copyWith(
                        color: customBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  int _currentIndex = 0;
  _onChangedFunction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    var paper = Get.arguments as QuestionPaperModel;
    return PageView(
      controller: _pageController,
      // physics: NeverScrollableScrollPhysics(),
      onPageChanged: _onChangedFunction,
      children: [
        for (var q in paper.questions!)
          buildQuestionPreview(q, context, paper.questions!.length, paper)
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

enum SwitchableColors { active, inactive }

Color activeColor = Colors.white60;
Color inactiveColor = Colors.white;
