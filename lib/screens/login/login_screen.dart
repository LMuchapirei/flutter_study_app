import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            Text(
                "This is a study app.You can use it as you want.You have full access to all the stuff 😊😊")
          ],
        ),
      ),
    );
  }
}
