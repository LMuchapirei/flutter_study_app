import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../controllers/chat_documents/document_uploader.dart';

class ChatScreen extends GetView<DocumentUploader> {
  const ChatScreen({Key? key}) : super(key: key);
  static String routeName = "/chat";
  @override
  Widget build(BuildContext context) {
    DocumentUploader _documentUploaderController = Get.find();
    AuthController _authController = Get.find();
    // _documentUploader.getDocuments(_authController.getUser()!);
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
                          "Want to chat with a pdf, upload one or continue with existing pdf's",
                          textAlign: TextAlign.center,
                          style: headerTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 7,
                  child: Obx(
                  () {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8
                      ),
                      child: ContentArea(
                        child: ListView.separated(
                          itemBuilder:  (context, index) {
                            final document = _documentUploaderController.myDocuments[index];
                            return Ink(                      
                              child: GestureDetector(
                                onTap: () async {
                                  final file = await _documentUploaderController.getFile(document.downloadUrl!);
                                  showModalBottomSheet(
                                    context: context, 
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    builder: (context){
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                          )
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Document ${_documentUploaderController.getFileName(document.documentName!)}"),
                                            Container(
                                              height: MediaQuery.of(context).size.height * 0.65,
                                              child: PDFView(
                                                filePath: file.path,
                                                enableSwipe: true,
                                                swipeHorizontal: true,                                                
                                                autoSpacing: false,
                                                pageFling: false,
                                                onRender: (_pages) {
                                                
                                                },
                                                onError: (error) {
                                                  print(error.toString());
                                                },
                                                onPageError: (page, error) {
                                                  print('$page: ${error.toString()}');
                                                },
                                                onViewCreated: (PDFViewController pdfViewController) {
                                                
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                  });
                                },
                                child: Container(
                                 decoration: BoxDecoration(
                                 color: Colors.white,                
                                 ),
                                  child: Column(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: Colors.blue,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 3,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              _documentUploaderController.getFileName(document.documentName!),
                                              ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade200,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add,color: Colors.grey,),
                                            SizedBox(width: 10,),
                                            Text(document.uploadTime ?? "Nov 21, 2023"),
                                          ],
                                        ),
                                        Icon(Icons.chat_outlined,color: Colors.grey,),
                                        Container(
                                          height: 20,
                                          width: 60,
                                          margin: EdgeInsets.symmetric(
                                            vertical: 5
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Icon(Icons.delete_outline),
                                        )
                                      ],
                                    )
                                    
                                  ]),
                                ),
                              ) ,
                            );
                          }, 
                          separatorBuilder: (BuildContext context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              }, 
                          itemCount: _documentUploaderController.myDocuments.length),
                      ),
                        );
                    }
                  ),
                ),
              Flexible(
                flex: 3,
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                  margin: UIParameters.mobileScreenPadding,
                  width: MediaQuery.of(context).size.width,                           
                  decoration: BoxDecoration(
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
                             _documentUploaderController.uploadDocument(firstFile,_authController.getUser()!);
                          }
                        } else {
                          print("No file selected");
                        }
                 
                    },
                    child: SvgPicture.asset(
                        "assets/images/addpdf.svg",
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.height * 0.1,
                        semanticsLabel: 'Acme Logo'
                      ),
                  ),
                ),
                Obx(
                   () {
                    final hasDocuments = _documentUploaderController.myDocuments.isNotEmpty;
                    return Padding(
                      padding: UIParameters.mobileScreenPadding,
                      child: 
                      !hasDocuments ?
                      Text("No files uploaded at the moment to chat with,click the button above to upload a new pdf file",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ):
                       Text("Click the button above to upload a new pdf file",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,),
                    );
                  }
                )
                ],
                            ))
              ],
            ),
         ),
      ),
    );
  }
}