// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/widgets/common/custom_form_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/questions_uploader/question_model.dart';
import '../../controllers/questions_uploader/questions_uploader.dart';
import '../../widgets/common/main_button.dart';


class QuestionsUploadHome extends GetView<QuestionsUploaderController> {
  const QuestionsUploadHome({Key? key}) : super(key: key);
  static String routeName = "/upload";
  @override
  Widget build(BuildContext context) {
    QuestionsUploaderController _questionsUploadController = Get.find();
    AuthController _authController = Get.find();
    return SafeArea(
      child: Scaffold(
        body:
         Container(
          height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(gradient: mainGradient(context)),
           child: 
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  
                Spacer(),
                Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                "Hello Friend",
                                style: detailTextStyle.copyWith(
                                    color: onSurfaceTextColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10
                        ),
                        child: Text(
                          "Want to create own question bank? Click add question below.",
                          textAlign: TextAlign.center,
                          style: headerTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Spacer(
                  flex: 3,
                ),
                Container(
                  margin: UIParameters.mobileScreenPadding,
                  width: MediaQuery.of(context).size.width,                           
                  decoration: BoxDecoration(
                    borderRadius: UIParameters.cardBorderRadius,
                  ),
                  child: GestureDetector(
                    onTap: () async {               
                        QuestionSubject? questionHeaderData =  await showModalBottomSheet(
                           context: context,
                           isDismissible: false,
                           backgroundColor:  customScaffoldColor(context),
                           shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(cardBorderRadius)),
                           ),
                           builder: (_){
                            return Padding(
                              padding:  EdgeInsets.only(
                                bottom:    
                                    MediaQuery.of(context).viewInsets.bottom
                                  
                              ),
                              child: DraggableScrollableSheet(
                                minChildSize: 0.9,
                                maxChildSize: 1,
                                initialChildSize: 0.9,
                                builder: (_,controller){
                                  return Padding(
                                    padding: UIParameters.mobileScreenPadding,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Form(
                                       key: _questionsUploadController.formKey,
                                        child: Column(
                                            children: [
                                                Center(
                                                  child: Text("Create Question",style: detailTextStyle.copyWith(
                                                  fontSize: 18,
                                                  color: Get.isDarkMode
                                                      ? Colors.white
                                                      : Theme.of(context).primaryColor),),
                                                ),
                                                CustomFormField(
                                                  hintText: "Subject",
                                                  requiresPadding: false,
                                                  validator: _questionsUploadController.validateSubject,
                                                  onSaved: _questionsUploadController.saveSubject,

                                                  ),
                                                CustomFormField(
                                                  hintText: "Number of Questions",
                                                  requiresPadding: false,
                                                  textInputType:  TextInputType.number,
                                                  validator: _questionsUploadController.validateNumberOfQuestions,
                                                  onSaved: _questionsUploadController.saveNumberOfQuestions,

                                                  ),
                                      
                                              Padding(
                                                padding:UIParameters.mobileScreenPadding,
                                                child: MainButton(
                                                  onTap: () async {
                                                    final questionBankHeader = await _questionsUploadController.createQuestionHeader();
                                                    if(questionBankHeader != null){
                                                       Navigator.of(context).pop(questionBankHeader);
                                                    }
                                                  },
                                                  title: 'Add Questions',
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                              }),
                            );
                        });
                       /// We will be here unless there is an error
                       print(questionHeaderData);
                       /// Capture the questions and the images 
                       if(questionHeaderData != null)
                       showModalBottomSheet(
                           context: context, 
                           isDismissible: false,
                           backgroundColor:  customScaffoldColor(context),
                           isScrollControlled: true,
                           shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(cardBorderRadius)),
                           ),
                          builder: (context){
                              return Padding(
                              padding:  EdgeInsets.only(
                                // bottom:    
                                //     MediaQuery.of(context).viewInsets.bottom                
                              ),
                              child: QuestionEntryForm(questionHeaderData: questionHeaderData));
                          });
                    },
                    child: SvgPicture.asset(
                        "assets/images/addpdf.svg",
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.height * 0.1,
                        semanticsLabel: 'Acme Logo'
                      ),
                  ),
                ),
              ],
            ),
         ),
      ),
    );
  }
}

class QuestionEntryForm extends StatefulWidget {
   QuestionEntryForm({
    Key? key,
    required this.questionHeaderData,
  }) : super(key: key);

  final QuestionSubject? questionHeaderData;

  @override
  State<QuestionEntryForm> createState() => _QuestionEntryFormState();
}

class _QuestionEntryFormState extends State<QuestionEntryForm> {
  List<Step> steps= [];
  int currentQuestion = 0;
  Map<int,Map<String,dynamic>> _questionsMap = {};
  void generateSteps(){
    List<Step> _steps = [];
    final questionCount = widget.questionHeaderData!.numberOfQuestions;
    for(var idx = 0; idx < questionCount!; idx++){
      final _currentStep = Step(
        title: Text("Question ${idx + 1}"), 
        content: Column(
        children: [
          CustomFormField(hintText: "Enter Question",onChange: (p0) {
            setState(() {
             _questionsMap[idx]={
              "Question":p0
            };
            });
          },),
          
          Center(
            child: MainButton(
              title: "Click Add Image",
              onTap: () async{
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg','png']
                );
                if (result != null) {
                List<File> files = result.paths.map((path) => File(path!)).toList();
                //// Handle file uploading to firebase storage
                final firstFile = files.first;
                if(files.isNotEmpty){
                   //// Handler to capture document uplaod
                   setState(() {
                      final currentEntry = _questionsMap[idx];
                      _questionsMap[idx]={
                          ...currentEntry!,
                          "image":firstFile
                      };
                   });
                }
              } else {
                print("No file selected");
              }
            }),
          )
        ],
      ));
      _steps.add(_currentStep);
      _questionsMap[idx] = {};

    }
    setState(() {
      steps = _steps;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateSteps();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: UIParameters.mobileScreenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              Text("Let create the questions"),
              Expanded(
                child: Stepper(
                  type: StepperType.vertical,
                  currentStep: currentQuestion,
                  steps: steps,
                  onStepCancel: () {
                    setState(() {
                      if (currentQuestion > 0) {
                        currentQuestion -= 1;
                      } else {
                        // Cancel button pressed on the first step
                      }
                    });
                  },
                  onStepContinue: () {
                     setState(() {
                        if (currentQuestion < steps.length - 1) {
                          print(_questionsMap);
                          currentQuestion += 1;
                        } else {
                          // Finish button pressed
                          // You can perform any final actions here
                          /// Generate the Questions here as a model or continue to work with the maps in the dark
                        }
                      });
                  },
                  ),
              )
            ],
          ),
        );
  }
}