import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                "This is a study app.You can use it as you want.You have full access to all the stuff 😊😊",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
              ),
            ),
            MainButton(
              onTap: () {
                controller.signInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.asset("assets/icons/google.svg"),
                  ),
                  Center(
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
