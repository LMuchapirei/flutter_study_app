import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
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
                        await showModalBottomSheet(
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
                                      child: Column(
                                          children: [
                                              Center(
                                                child: Text("Create Question",style: detailTextStyle.copyWith(
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Theme.of(context).primaryColor),),
                                              ),
                                              TextField(
                                                decoration: UIParameters.inputDecoration(hintText: "Subject"),
                                              ),

                                            Padding(
                                              padding:UIParameters.mobileScreenPadding,
                                              child: MainButton(
                                                onTap: () {
                                                  
                                                },
                                                title: 'Add Question',
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                              }),
                            );
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