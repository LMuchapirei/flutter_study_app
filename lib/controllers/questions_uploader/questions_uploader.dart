import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:get/get.dart';





class QuestionsUploaderController extends GetxController{

   final formKey = GlobalKey<FormState>();
   Map<String,dynamic> questionBank = {
    "subject":"",
    "numberOfQuestions":""
   };
    @override
    void onReady(){
      super.onReady();
      AuthController _authController = Get.find();
    }
   

    Future<void> uploadQuestion( ) async {

    }

    String? validateSubject(String? subject){
      if(subject!.isEmpty){
        return "Please enter valid subject";
      }
      return null;
    }

    void saveSubject(String? subject) =>  questionBank["subject"] = subject;
    void saveNumberOfQuestions(String? numberOfQuestions) =>  questionBank["numberOfQuestions"] = numberOfQuestions;


    String? validateNumberOfQuestions(String? questionsCount){
        if(questionsCount!.isEmpty){
        return "Please enter valid number of questionsCount";
      }
      return null;
    }

    Future createQuestionHeader() async {
      if(formKey.currentState!.validate()){
        Get.snackbar("Success", 
        "Created Question Bank,proceed to add questions under this subject",
        snackPosition:SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.green
        );
        /// Build the question object and return it to caller
        formKey.currentState!.save();
        return;
      }
      Get.snackbar(
        "Error",
        "Failed to create Question Bank,please try again",
        snackPosition:SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red
        );
    }
}