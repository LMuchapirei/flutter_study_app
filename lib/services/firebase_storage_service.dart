import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  // Load an image from firebase storage
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    print("Hello ndiripano");
    final storageRef =
        FirebaseStorage.instance.ref().child("question_paper_images");
    final listResult = await storageRef.listAll();
    print(" LIst ref $listResult");
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('/${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
