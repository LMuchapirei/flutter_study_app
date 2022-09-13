import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:get/get.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';

class AnswersReport extends StatelessWidget {
  const AnswersReport({Key? key}) : super(key: key);
  static String routeName = "/answersReport";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding - 10),
            child: Column(children: [
              Center(child: Text("1 out of 5 where correct")),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ContentArea(
                      child: ListView.separated(
                padding: UIParameters.mobileScreenPadding,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorderRadius),
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
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 5,
              )))
            ]),
          ),
        ),
      ),
    );
  }
}
