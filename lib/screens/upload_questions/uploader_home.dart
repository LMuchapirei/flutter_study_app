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
  final Map<int,Map<String,dynamic>> _questionsMap = {};
  void generateSteps(){
    List<Step> _steps = [];
    final questionCount = widget.questionHeaderData!.numberOfQuestions;
    for(var idx = 0; idx < questionCount!; idx++){
      final _currentStep = Step(
        title: Text("Question ${idx + 1}"), 
        content: ParentQuestion(
          currentMapValue:_questionsMap[idx] ?? {},
          onChangeQuestionText: (p0) {
              setState(() {
              final currentEntry = _questionsMap[idx];
             _questionsMap[idx]={
              ...currentEntry!,
              "Question":p0
            };
            });
        },
        onChangeFile: (file){
                            setState(() {
                      final currentEntry = _questionsMap[idx];
                      _questionsMap[idx]={
                          ...currentEntry!,
                         "image":file
                    };
              });
        },
        )
      )
      ;
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
                          print(_questionsMap[0]);
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

//// Maintain the state of each widget
// ignore: must_be_immutable
class ParentQuestion extends StatefulWidget {
  Function(String?)? onChangeQuestionText;
  Function(File) onChangeFile;
  Map<String,dynamic> currentMapValue;
  ParentQuestion({Key? key,required this.onChangeQuestionText,required this.onChangeFile,required this.currentMapValue}) : super(key: key);

  @override
  State<ParentQuestion> createState() => _ParentQuestionState();
}

class _ParentQuestionState extends State<ParentQuestion> {
  File? currentFile;
  List<AnswerModel> currentAnswers = [];
  /// Refactor this to own file
  void captureFile() async {
   FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg','png']
   );
   if(result !=null){
    List<File> files = result.paths.map((path)=>File(path!)).toList();
    if(files.isNotEmpty){
      final firstFile = files.first;
      widget.onChangeFile(firstFile);
      setState(() {
        currentFile = firstFile;
      });
    } else {
      /// show snackbar to say no file selected
    }
   }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomFormField(hintText: "Enter Question",onChange: widget.onChangeQuestionText,),
          currentFile !=null ?
          Container(
            height: 120.0,
            width: 120.0,
            child: Stack(
              children: [
                Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                      child: Image.file(currentFile!,)),
                ),
                InkWell(
                  onTap: () {
                    captureFile();
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(Icons.edit,color: Colors.blue,)),
                )
              ],
            ),
          )
          :
          Center(
            child: MainButton(
              title: "Add Figure(Optional)",
              onTap: () async{
               captureFile();
              }),
          ),
          AnswerForm(answersCount: 4, saveAnswer: (p0) {
            setState(() {
              currentAnswers = p0;
            });
            print("Current answers $currentAnswers");
          },),
      ],
    );
  }
}
class AnswerForm extends StatefulWidget {
  final int answersCount;
  final Function(List<AnswerModel>) saveAnswer;
  const AnswerForm({Key? key,required this.answersCount,required this.saveAnswer}) : super(key: key);

  @override
  State<AnswerForm> createState() => _AnswerFormState();
}

class _AnswerFormState extends State<AnswerForm> {

  Map<int,String> countToChar = {0:'A',1:'B',2:'C',3:'D',4:'E',5:'F'};
  Map<int,File> answerToImage = {};
  Map<int,String> answerToText={};


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(var idx=0;idx<widget.answersCount;idx++)
          buildForm(idx),
        SizedBox(
          height: 10,
        ),
          Center(
            child: MainButton(
              title: "Save Answers",
              onTap: () async{
                 generateAnswerModel();
              }),
          ),
      ],
    );
  }

   void captureAnswerFile(int answerKey) async {
   FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg','png']
   );
   if(result !=null){
    List<File> files = result.paths.map((path)=>File(path!)).toList();
    if(files.isNotEmpty){
      final firstFile = files.first;
      setState(() {
       answerToImage[answerKey] = firstFile;
      });
    } else {
      /// show snackbar to say no file selected
    }
   }
  }

  Widget buildForm(int count){
    return Column(
      children: [
        CustomFormField(hintText: "Enter answer ${countToChar[count]}",
        onChange: (text) {
          setState(() {
            answerToText[count] = text!;
          });
        },),

        answerToImage[count] != null ?
          Row(
          children: [
            InkWell(
              child: Text("Preview Image")),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    captureAnswerFile(count);
                  },
                  child: Icon(
                    Icons.edit,
                    size: 14,
                    color: Colors.blue,),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      answerToImage.remove(count);    
                    });
                  },
                  child: Icon(Icons.delete,color: Colors.red,))
              ],
            ),
          ],
        )
        :
        Row(
          children: [
            Text("Upload Supporting Figure(Optional)"),
            InkWell(
              onTap: () {
                captureAnswerFile(count);
              },
              child: Icon(
                Icons.add_a_photo,
                size: 14,
                color: Colors.blue,),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  void generateAnswerModel(){
    List<AnswerModel> tempAnswers = [];
    for (var key in countToChar.keys){
      final identifier = countToChar[key];
      final answer = answerToText[key];
      final image = answerToImage[key];
      final answerObj = AnswerModel(answer: answer,identifier: identifier,image: image);
      tempAnswers.add(answerObj);
    }
    widget.saveAnswer(tempAnswers);
  }

}