import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:get/get.dart';





class QuestionsUploaderController extends GetxController{
    @override
    void onReady(){
      super.onReady();
      AuthController _authController = Get.find();
    }
   

    Future<void> uploadQuestion( ) async {

    }
}