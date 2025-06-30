import 'package:get_it/get_it.dart';
import 'package:codealpha_flashcard_quiz_app/business_logic/business_logic_repositories/flashcard_repository.dart';
import 'package:codealpha_flashcard_quiz_app/data_layer/data_repositories/flashcard_repository_impl.dart';
import 'package:codealpha_flashcard_quiz_app/business_logic/business_logic_usecases/flashcard_usecases.dart';

/// Global service locator instance
final GetIt serviceLocator = GetIt.instance;

/// Dependency injection setup
class ServiceLocator {
  /// Initialize all dependencies
  static Future<void> init() async {
    // Register repositories
    _registerRepositories();
    
    // Register use cases
    _registerUseCases();
    
    // Register services
    _registerServices();
  }

  /// Register all repositories
  static void _registerRepositories() {
    // Flashcard repository - using singleton instance
    serviceLocator.registerLazySingleton<FlashcardRepository>(
      () => FlashcardRepositoryImpl.instance,
    );
  }

  /// Register all use cases
  static void _registerUseCases() {
    // Flashcard use cases
    serviceLocator.registerLazySingleton(
      () => GetAllFlashcards(
        serviceLocator<FlashcardRepository>(),
      ),
    );
    
    serviceLocator.registerLazySingleton(
      () => AddFlashcard(
        serviceLocator<FlashcardRepository>(),
      ),
    );
    
    serviceLocator.registerLazySingleton(
      () => UpdateFlashcard(
        serviceLocator<FlashcardRepository>(),
      ),
    );
    
    serviceLocator.registerLazySingleton(
      () => DeleteFlashcard(
        serviceLocator<FlashcardRepository>(),
      ),
    );
  }

  /// Register all services
  static void _registerServices() {
    // Add any additional services here
    // Example: Analytics, Network, Storage, etc.
  }

  /// Dispose all dependencies
  static Future<void> dispose() async {
    await serviceLocator.reset();
  }
} 