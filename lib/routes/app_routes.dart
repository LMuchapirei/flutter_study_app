import 'package:flutter_study_app/screens/introduction/introduction.dart';

import '../screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen())
      ];
}
