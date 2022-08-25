import 'package:flutter_study_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgNames = ["biology", "chemistry", "maths", "physics"];
    for (var img in imgNames) {
      final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
      print(imgUrl);
      if (imgUrl != null) allPaperImages.add(imgUrl);
    }
    try {} catch (e) {
      print(e);
    }
  }
}
