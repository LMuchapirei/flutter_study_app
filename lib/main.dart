import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/bindings/initial_bindings.dart';
import 'package:flutter_study_app/configs/themes/app_light_theme.dart';
import 'package:flutter_study_app/data_uploader_screen.dart';
import 'package:flutter_study_app/firebase_options.dart';
import 'package:flutter_study_app/routes/app_routes.dart';
import 'package:flutter_study_app/screens/introduction/introduction.dart';
import 'package:flutter_study_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

// For uploading files in firestore
//void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: LightTheme().buildLightTheme(), getPages: AppRoutes.routes());
  }
}
