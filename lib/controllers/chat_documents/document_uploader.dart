
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'document_model.dart';




class DocumentUploader extends GetxController{
    final myDocuments = <PDFDocument>[].obs;
    @override
    void onReady(){
      super.onReady();
      AuthController _authController = Get.find();
      getDocuments(_authController.getUser()!);
    }
   
    getFileName(String filePath){
      return basename(filePath);
    }

    Future<void> uploadDocument(File file,User user ) async {
      final _firebaseStorage = FirebaseStorage.instance;
      var snapshot = await _firebaseStorage.ref()
          .child('documents/test')
          .putFile(file)
          .whenComplete(() {
            print("Completed file upload");
          });
      var downloadUrl = await snapshot.ref.getDownloadURL();
      /// Upload this url in a document matching the user name etc
      saveDocument(downloadUrl, file.path, user);
    }

   /// please add exception handling
   saveDocument(String downloadUrl,String documentName,User user){
    final uploadTime = DateFormat.yMMMd().format(DateTime.now());
     final userId = user.uid;
     documentRF.doc(userId).collection("myDocuments").doc().set({
        "documentName":documentName,
        "downloadUrl":downloadUrl,
        "uploadTime":uploadTime
     });
   }

   Future<void> getDocuments(User user) async {
      final querySnapshot = await  documentRF.doc(user.uid).collection("myDocuments").get();
      final documentsList = <PDFDocument>[];
      for (var element in querySnapshot.docs) {
        final document = PDFDocument.fromJson(element.data());
        print("document $document");
        documentsList.add(document);
      }
     myDocuments.assignAll(documentsList);
   }

   Future<File> getFile(String downloadUrl) async {
      final file = await DefaultCacheManager().getSingleFile(downloadUrl);
      return file;
   }
}