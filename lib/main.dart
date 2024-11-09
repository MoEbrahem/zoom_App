import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_app/resources/auth_method.dart';
import 'package:zoom_app/screens/homeScreen.dart';
import 'package:zoom_app/screens/login_screen.dart';
import 'package:zoom_app/screens/video_call_screen.dart';
import 'package:zoom_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyDq1KdsXCsHm0k1hdr0zlBjndLFBsNHFic",
            appId: "com.example.zoom_app",
            messagingSenderId: "632002049273",
            projectId: "zoom-872b4",
          ),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "video-call" : (context) => const VideoCallScreen(), 
      },
      home: StreamBuilder(
        stream: AuthMethod().authchange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
