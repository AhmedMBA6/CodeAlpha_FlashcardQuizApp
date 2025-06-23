import 'package:codealpha_flashcard_quiz_app/app.dart';
import 'package:codealpha_flashcard_quiz_app/app_core/config/environment_config.dart';
import 'package:flutter/material.dart';

void main() {
  // Development-specific configuration
  const flavor = 'dev';
  
  // Print environment information for debugging
  EnvironmentConfig.printEnvironmentInfo();
  
  // You can add dev-specific setup here
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(MyApp(flavor: flavor));
} 