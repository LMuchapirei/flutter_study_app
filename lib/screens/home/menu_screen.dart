import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/chat/chat_home.dart';
import 'package:flutter_study_app/screens/upload_questions/uploader_home.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor),
                            ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(icon: Icons.chat_bubble_outline, label: "Chat", onPressed: (){
                       Get.toNamed(ChatScreen.routeName);
                    }),
                    _DrawerButton(
                        icon: Icons.web,
                        label: "WebSite",
                        onPressed: () {
                          controller.webSite(); /// Go to the chat with the pdf in netlify
                        }),
                    _DrawerButton(
                        icon: Icons.school,
                        label: "Questions",
                        onPressed: () {
                         Get.toNamed(QuestionsUploadHome.routeName);
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: _DrawerButton(
                          icon: Icons.email,
                          label: "Email",
                          onPressed: () {
                            controller.email();
                          }),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    _DrawerButton(
                        icon: Icons.logout,
                        label: "Logout",
                        onPressed: () {
                          controller.logout();
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  const _DrawerButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        icon,
        size: 15,
      ),
      onPressed: onPressed,
      label: Text(label),
    );
  }
}
