import 'package:flutter/material.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                color: Colors.amber,
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                  'This is a study app. You can use it as you want. If you understand how this works you will be able to scale it.With this you will master firebase backend and flutter frontend.'),
              SizedBox(
                height: 40,
              ),
              AppCircleButton(
                opTap: () => null,
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}
