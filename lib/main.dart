import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind_mosaic1/auth_controller.dart';
import 'package:mind_mosaic1/view_models/app_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mind_mosaic1/splash_screen.dart';
// ignore: unused_import
// import 'package:mind_mosaic1/auth_controller.dart';
// ignore: unused_import
// import 'package:mind_mosaic1/login_page.dart';

// ignore: unused_import
// import 'package:mind_mosaic1/signup_page.dart';
// import 'package:mind_mosaic1/splash_screen.dart';

// ignore: unused_import
// import 'package:mind_mosaic1/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp().then((value) => Get.put(AuthController()));
//   runApp(ChangeNotifierProvider(
//       create: (context) => AppViewModel(), child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: SplashScreen());
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
