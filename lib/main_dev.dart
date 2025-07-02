import 'package:flutter/material.dart';
import 'app.dart';
import 'app_core/config/environment_config.dart';
import 'app_core/di/service_locator.dart';

/// Development environment entry point

void main() async{
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Development-specific configuration
  const flavor = 'dev';
  
  // Print environment information for debugging
  EnvironmentConfig.printEnvironmentInfo();

  // Initialize service locator
  await ServiceLocator.init();

  // Run the app
  runApp(FlashcardQuizApp(flavor: flavor));
} 