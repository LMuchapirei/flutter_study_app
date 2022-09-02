import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/home/menu_screen.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/app_icons.dart';
import 'package:flutter_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    QuizPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        controller: _.zoomDrawerController,
        showShadow: true,
        borderRadius: 50.0,
        angle: 0.0,
        style: DrawerStyle.DefaultStyle,
        slideWidth: MediaQuery.of(context).size.width * .6,
        menuScreen: MenuScreen(),
        mainScreen: Container(
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
                      AppCircleButton(
                        child: Icon(
                          AppIcons.menuLeft,
                        ),
                        opTap: controller.toggleDrawer,
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
                          itemCount:
                              _questionPaperController.allPapers.length)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
