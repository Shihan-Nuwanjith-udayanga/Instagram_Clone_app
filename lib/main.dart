import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/authentication/login_screen.dart';
import 'package:instagram_clone/screens/authentication/register_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAg6gr1MDbReVmwPtRahqJNY082DHgZeYY",
              appId: "1:679812814533:android:5bf2998839842e891302ac",
              messagingSenderId: "679812814533",
              projectId: "instagram-clone-3c7bb"),
        )
      : await Firebase.initializeApp();

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
      home: RegisterScreen(),
    );
  }
}
