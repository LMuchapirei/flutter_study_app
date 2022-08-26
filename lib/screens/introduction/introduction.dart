import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                  'This is a study app. You can use it as you want. If you understand how this works you will be able to scale it.With this you will master firebase backend and flutter frontend.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: onSurfaceTextColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40,
              ),
              AppCircleButton(
                opTap: () {
                  Get.offAndToNamed("/home");
                },
                child: const Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ),
    );
  }
}
