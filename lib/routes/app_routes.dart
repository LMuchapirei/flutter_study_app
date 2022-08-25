import 'package:flutter/foundation.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/introduction/introduction.dart';

import '../screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
            }))
      ];
}
