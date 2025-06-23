import 'package:codealpha_flashcard_quiz_app/app.dart';
import 'package:codealpha_flashcard_quiz_app/app_core/config/environment_config.dart';
import 'package:flutter/material.dart';

void main() {
  // Production-specific configuration
  const flavor = 'prod';
  
  // Print environment information for debugging
  EnvironmentConfig.printEnvironmentInfo();
  
  // You can add prod-specific setup here
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(MyApp(flavor: flavor));
} 