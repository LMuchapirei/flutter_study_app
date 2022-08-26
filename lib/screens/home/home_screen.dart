import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/app_icons.dart';
import 'package:flutter_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(mobileScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    AppIcons.menuLeft,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          AppIcons.peace,
                        ),
                        Text(
                          "Hello Friend",
                          style: detailTextStyle.copyWith(
                              color: onSurfaceTextColor),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "What do you want to learn today?",
                    style: headerTextStyle,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ContentArea(
                  addPadding: false,
                  child: Obx(() => ListView.separated(
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
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
