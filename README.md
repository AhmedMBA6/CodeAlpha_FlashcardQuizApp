# CodeAlpha Flashcard Quiz App

A modern Flutter application for creating, managing, and studying flashcards with an integrated quiz system. Built with clean architecture principles and featuring a beautiful, responsive UI.

## 🎯 Project Overview

This flashcard quiz app allows users to:
- Create and manage custom flashcards
- Study flashcards with interactive flip animations
- Take quizzes to test knowledge retention
- Track learning progress
- Enjoy a modern, accessible user interface

## ✨ Features

### Core Functionality
- **Flashcard Management**: Create, edit, and delete flashcards
- **Interactive Study Mode**: Flip cards with smooth animations
- **Quiz System**: Test knowledge with randomized questions
- **Progress Tracking**: Monitor learning progress
- **Data Persistence**: Local storage using SharedPreferences

### UI/UX Features
- **Modern Design**: Clean, intuitive interface with Material Design 3
- **Responsive Layout**: Adapts to different screen sizes
- **Dark/Light Theme**: Automatic theme switching
- **Smooth Animations**: Engaging flip card animations
- **Accessibility**: Screen reader support and semantic labels

### Technical Features
- **Clean Architecture**: Separation of concerns with domain, data, and presentation layers
- **Dependency Injection**: Using GetIt for service management
- **Flavor Support**: Separate development and production builds
- **Custom Widgets**: Reusable UI components
- **State Management**: Efficient state handling

## 🏗️ Architecture

The app follows Clean Architecture principles with clear separation of concerns:

```
lib/
├── app_core/
│   ├── config/
│   ├── di/
│   ├── navigation/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── business_logic/
│   ├── business_logic_entities/
│   ├── business_logic_repositories/
│   └── business_logic_usecases/
├── data_layer/
│   ├── data_models/
│   ├── data_repositories/
│   └── data_sources/
└── ui/
    └── ui_pages/
        ├── flashcard_management/
        │   ├── flashcard_management_page.dart
        │   ├── flashcard_list.dart
        │   ├── flashcard_card.dart
        │   └── flashcard_dialog.dart
        ├── quiz/
        │   ├── quiz_page.dart
        │   ├── quiz_card.dart
        │   └── quiz_controls.dart
        ├── home/
        │   ├── home_page.dart
        │   └── feature_card.dart
        ├── results/
        │   └── results_screen.dart
        └── main_navigation.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd codealpha_flashcard_quiz_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up flavors** (Important!)
   This project uses separate entry points for development and production environments.

## 🎯 Running the App

### Development Environment
```bash
# Run development flavor
flutter run --flavor dev --target lib/main_dev.dart

# Build development APK
flutter build apk --flavor dev --target lib/main_dev.dart
```

### Production Environment
```bash
# Run production flavor
flutter run --flavor prod --target lib/main_prod.dart

# Build production APK
flutter build apk --flavor prod --target lib/main_prod.dart
```

### Web Development
```bash
# Run for web
flutter run -d chrome --target lib/main_dev.dart
```

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🛠️ Development Workflow

### Code Structure Guidelines

1. **Follow Clean Architecture**: Keep domain, data, and presentation layers separate
2. **Use Dependency Injection**: Register services in `lib/app_core/di/service_locator.dart`
3. **Custom Widgets**: Use shared widgets from `lib/app_core/widgets/`
4. **Theming**: Follow the theme system in `lib/app_core/theme/`

### Adding New Features

1. **Domain Layer**: Define entities and use cases in `business_logic/`
2. **Data Layer**: Implement repositories in `data_layer/`
3. **UI Layer**: Create pages and sub-widgets in `ui/ui_pages/`
4. **Navigation**: Add routes in `lib/app_core/navigation/routes.dart`

### Testing

#### Unit & Widget Tests
```bash
flutter test
```

#### Integration Tests
```bash
flutter test integration_test/full_flow_test.dart
```
See `integration_test/full_flow_test.dart` for a sample full user flow test.

## 📦 Dependencies

### Core Dependencies
- **flutter**: Flutter SDK
- **google_fonts**: Custom typography
- **shared_preferences**: Local data persistence
- **flip_card**: Interactive card animations
- **flutter_screenutil**: Responsive design utilities
- **get_it**: Dependency injection

### Development Dependencies
- **flutter_test**: Testing framework
- **integration_test**: Integration testing
- **flutter_lints**: Code quality and style
- **flutter_launcher_icons**: App icon generation
- **flutter_native_splash**: Splash screen generation

## 🎨 Customization

### App Icons
The app uses `flutter_launcher_icons` for icon generation. Configuration is in `flutter_launcher_icons.yaml`.

### Splash Screen
Splash screen configuration is in `flutter_native_splash.yaml`.

### Theming
Customize themes in `lib/app_core/theme/`:
- `app_colors.dart`: Color definitions
- `app_light_theme.dart`: Light theme
- `app_dark_theme.dart`: Dark theme
- `app_text_theme.dart`: Typography

## 🔧 Configuration

### Environment Configuration
Environment-specific settings are managed in `lib/app_core/config/environment_config.dart`.

### Build Variants
- **Development**: Debug mode with development configurations
- **Production**: Release mode with production configurations

## 🐛 Troubleshooting

### Common Issues

1. **Build Fails Without Target**
   - Always specify `--target` flag when running or building
   - Use `lib/main_dev.dart` for development
   - Use `lib/main_prod.dart` for production

2. **Dependencies Issues**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Android Build Issues**
   - Ensure Android SDK and NDK are properly configured
   - Check `android/app/build.gradle.kts` for version compatibility

4. **iOS Build Issues**
   - Ensure Xcode is up to date
   - Run `flutter doctor` to check iOS toolchain

### Debug Commands

```bash
# Check Flutter installation
flutter doctor

# Clean and rebuild
flutter clean
flutter pub get

# Analyze code
flutter analyze
```

## 📄 License

This project is developed as part of the CodeAlpha Internship Program.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team

---

**Note**: This project uses a multi-flavor architecture. Always specify the correct entry point when running or building the application.