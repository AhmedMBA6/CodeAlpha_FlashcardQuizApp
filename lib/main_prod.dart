import 'package:flutter/material.dart';
import 'app.dart';
import 'app_core/config/environment_config.dart';



/// Production environment entry point
void main() {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Production-specific configuration
  const flavor = 'prod';
  
  // Print environment information for debugging
  EnvironmentConfig.printEnvironmentInfo();


  // Run the app
  runApp(const FlashcardQuizApp());
} 