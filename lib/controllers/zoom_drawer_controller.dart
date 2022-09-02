import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}

  void webSite() {
    launch("https://google.com");
  }

  void email() {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'muchapirei@gmail.com');
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch';
    }
  }

  void logout() {
    Get.find<AuthController>().signOut();
  }

  void facebook() {
    launch("https://facebook.com");
  }
}
