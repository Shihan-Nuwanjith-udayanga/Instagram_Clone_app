import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/authentication/login_screen.dart';
import 'package:instagram_clone/screens/authentication/register_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // check weather the web or mobile and firebase
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAAtyRRTiZNYdk-Eu08WgjPcsdoTA7cobA",
          authDomain: "instagram-clone-3c7bb.firebaseapp.com",
          projectId: "instagram-clone-3c7bb",
          storageBucket: "instagram-clone-3c7bb.appspot.com",
          messagingSenderId: "679812814533",
          appId: "1:679812814533:web:2c8d941c9a4a99001302ac"),
    );
  } else {
    await Firebase.initializeApp();
  }

  // Platform.isAndroid
  //   ? await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //           apiKey: "AIzaSyAg6gr1MDbReVmwPtRahqJNY082DHgZeYY",
  //           appId: "1:679812814533:android:5bf2998839842e891302ac",
  //           messagingSenderId: "679812814533",
  //           projectId: "instagram-clone-3c7bb"),
  //     )
  //   : await Firebase.initializeApp();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      title: "Instagram Clone",
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: RegisterScreen(),
    );
  }
}
