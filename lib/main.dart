import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/utils/service_locator/service_locator.dart';
import 'package:wink/firebase_options.dart';
import 'package:wink/t_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  print("🔑 GEMINI_API_KEY: ${dotenv.env['GEMINI_API_KEY']}");

  await setupServiceLocator();
  await setupOldServiceLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TStore());
}