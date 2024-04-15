import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/chat_documents/document_uploader.dart';

class ChatScreen extends GetView<DocumentUploader> {
  const ChatScreen({Key? key}) : super(key: key);
  static String routeName = "/chat";
  @override
  Widget build(BuildContext context) {
    DocumentUploader _documentUploader = Get.find();
    AuthController _authController = Get.find();
    _documentUploader.getDocuments(_authController.getUser()!);
    return SafeArea(
      child: Scaffold(
        body:
         Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(_documentUploader.myDocuments.isNotEmpty)
                Expanded(
                  child: Padding(padding: const EdgeInsets.symmetric(
                    horizontal: 8
                  ),
                  child: ContentArea(
                    addPadding: false,
                    child: ListView.separated(
                      itemBuilder:  (context, index) {
                        return Text("This is the item- $index");
                      }, 
                      separatorBuilder: (BuildContext context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          }, 
                      itemCount: _documentUploader.myDocuments.length)),
                    ) ,
                  ),
                Container(
                  margin: UIParameters.mobileScreenPadding,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: UIParameters.cardBorderRadius,
                  ),
                  child: GestureDetector(
                    onTap: () async {               
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    if (result != null) {
                          List<File> files = result.paths.map((path) => File(path!)).toList();
                          //// Handle file uploading to firebase storage
                          final firstFile = files.first;
                          if(files.isNotEmpty){
                             _documentUploader.uploadDocument(firstFile,_authController.getUser()!);
                          }
                        } else {
                          print("No file selected");
                        }
 
                    },
                    child: SvgPicture.asset(
                        "assets/images/addpdf.svg",
                        height: MediaQuery.of(context).size.width * 0.35,
                        width: MediaQuery.of(context).size.width * 0.35,
                        semanticsLabel: 'Acme Logo'
                      ),
                  ),
                ),
                Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Text("No files uploaded at the moment to chat with,click the button above to upload a new pdf file",
                  textAlign: TextAlign.center,),
                )
              ],
            ),
         ),
      ),
    );
  }
}