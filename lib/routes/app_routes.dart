import 'package:flutter_study_app/controllers/chat_documents/document_uploader.dart';
import 'package:flutter_study_app/controllers/question_paper/questions_controller.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/screens/chat/chat_home.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/introduction/introduction.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/screens/question/answer_check_screen.dart';
import 'package:flutter_study_app/screens/question/answers_report.dart';
import 'package:flutter_study_app/screens/question/question_screen.dart';
import 'package:flutter_study_app/screens/question/result_screen.dart';
import 'package:flutter_study_app/screens/question/test_overview_screen.dart';

import '../controllers/questions_uploader/questions_uploader.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/upload_questions/uploader_home.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: ChatScreen.routeName,
        page:()=>ChatScreen(),
        binding:BindingsBuilder(() {
          Get.put(DocumentUploader());
        }) ),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name:HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(name: QuestionsUploadHome.routeName,
                page:()=>QuestionsUploadHome(),
                binding: BindingsBuilder(() {
                Get.put<QuestionsUploaderController>(QuestionsUploaderController());
            }),
                ),
        GetPage(
            name: QuestionScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            }),
            page: () =>
                QuestionScreen()), // Bindings to be able to hook into the controller that we wrapped over this widget // Maybe l am using the wrong terminology
        GetPage(
            name: AnswersReport.routeName, page: () => const AnswersReport()),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => const TestOverviewScreen()),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
        GetPage(
            name: AnswerCheckScreen.routeName, page: () => AnswerCheckScreen()),
      ];
}
