import 'package:flutter/material.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/configs/themes/app_icons.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_styles.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  static String routeName = "/questionScreen";

  @override
  Widget build(BuildContext context) {
    var paper = Get.arguments as QuestionPaperModel;
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
                      "Q 03",
                      style:
                          detailTextStyle.copyWith(color: onSurfaceTextColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      AppIcons.menuLeft,
                      color: onSurfaceTextColor,
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                paper.questions![1].question,
                style: detailTextStyle.copyWith(color: onSurfaceTextColor),
              ),
              for (var ans in paper.questions![1].answers)
                Text(
                  ans.answer != null ? ans.answer! : "N/A",
                  style: detailTextStyle.copyWith(color: onSurfaceTextColor),
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
