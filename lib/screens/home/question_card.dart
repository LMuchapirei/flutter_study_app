import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/widgets/app_icon_text.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';

class QuestionCard extends GetView<QuizPaperController> {
  final QuestionPaperModel model;
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(cardBorderRadius),
              topLeft: Radius.circular(cardBorderRadius)),
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestion(paper: model, tryAgain: false);
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                          height: Get.width * 0.15,
                          width: Get.width * 0.15,
                          child: CachedNetworkImage(
                            imageUrl: model.imageUrl!,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                                "assets/images/app_splash_logo.png"),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                          child: Text(model.description),
                        ),
                        Row(
                          children: [
                            AppIconText(
                                text: Text(
                                  '${model.questionCount} questions',
                                  style: detailTextStyle.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor),
                                ),
                                icon: Icon(Icons.help_outline_sharp,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor)),
                            SizedBox(
                              width: 15,
                            ),
                            AppIconText(
                                text: Text(
                                  model.timeInMinutes(),
                                  style: detailTextStyle.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor),
                                ),
                                icon: Icon(Icons.timer,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: -_padding,
                  right: -_padding,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(cardBorderRadius),
                              topLeft: Radius.circular(cardBorderRadius)),
                          color: Theme.of(context).primaryColor),
                      child: Icon(
                        AppIcons.trophyOutline,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
