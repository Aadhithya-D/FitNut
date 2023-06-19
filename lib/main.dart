import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnut/screens/auth_page.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(colorScheme: const ColorScheme.light()
          .copyWith(primary: const Color(0xFF71C9CE))),
      home: const AuthPage(),
    );
  }
}
