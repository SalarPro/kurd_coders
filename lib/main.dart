import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurd_coders/firebase_options.dart';
import 'package:kurd_coders/src/my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
