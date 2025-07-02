# CodeAlpha Flashcard Quiz App

A modern, cross-platform Flutter application for creating, managing, and studying flashcards with an integrated quiz system. Built with clean architecture, robust environment configuration, and a beautiful, responsive UI.

---

## 🚀 Project Overview

- **Create, edit, and delete flashcards**
- **Study with interactive flip animations**
- **Take quizzes to test your knowledge**
- **Track your learning progress**
- **Enjoy a modern, accessible, and responsive UI**
- **Supports multiple environments (dev/prod) with separate Firebase projects**

---

## ✨ Features

- Flashcard management (CRUD)
- Quiz system with scoring
- Progress tracking
- Local data persistence (SharedPreferences)
- Firebase integration (dev/prod flavors)
- Modern Material 3 UI, dark/light themes
- Responsive layouts (`flutter_screenutil`)
- Clean architecture (domain, data, presentation layers)
- Dependency injection (`get_it`)
- Custom reusable widgets

---

## 🏗️ Project Structure

```
lib/
├── app_core/
│   ├── config/           # Environment config
│   ├── di/               # Dependency injection (service locator)
│   ├── navigation/       # App routing
│   ├── theme/            # Theming and colors
│   ├── utils/            # Utilities (e.g., screen utils)
│   └── widgets/          # Shared widgets
├── business_logic/
│   ├── business_logic_entities/
│   ├── business_logic_repositories/
│   └── business_logic_usecases/
├── data_layer/
│   ├── data_models/
│   ├── data_repositories/
│   └── data_sources/
├── ui/
│   └── ui_pages/
│       ├── flashcard_management/
│       ├── home/
│       ├── quiz/
│       ├── results/
│       └── main_navigation.dart
├── firebase_options_dev.dart
├── firebase_options_prod.dart
├── main_dev.dart
├── main_prod.dart
└── app.dart
```

---

## 🔥 Firebase & Flavors

- **Development and Production flavors** are supported.
- Each flavor uses its own Firebase project and configuration files.
- See `lib/firebase_options_dev.dart` and `lib/firebase_options_prod.dart`.
- **Android:** Place `google-services.json` in `android/app/src/dev/` and `android/app/src/prod/`
- **iOS:** Place `GoogleService-Info.plist` in the appropriate flavor folder (see iOS setup)
- Use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) to generate/update options files.

---

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (≥3.8.1)
- Dart SDK
- Android Studio or VS Code
- Android SDK (for Android)
- Xcode (for iOS/macOS)

### Installation

```bash
git clone <repository-url>
cd codealpha_flashcard_quiz_app
flutter pub get
```

---

## 🎯 Running the App

### Development Flavor

```bash
flutter run --flavor dev --target lib/main_dev.dart
flutter build apk --flavor dev --target lib/main_dev.dart
```

### Production Flavor

```bash
flutter run --flavor prod --target lib/main_prod.dart
flutter build apk --flavor prod --target lib/main_prod.dart
```

### Web

```bash
flutter run -d chrome --target lib/main_dev.dart
```

---

## 📱 Platform Support

- Android
- iOS
- Web
- Windows
- macOS
- Linux

---

## 🧩 Code Guidelines

- **Clean Architecture:** Domain, data, and presentation layers are separated.
- **Dependency Injection:** Register services in `lib/app_core/di/service_locator.dart`.
- **Custom Widgets:** Use shared widgets from `lib/app_core/widgets/`.
- **Theming:** Use the theme system in `lib/app_core/theme/`.
- **Environment Config:** Managed in `lib/app_core/config/environment_config.dart`.

---

## 🧪 Testing

- **Unit & Widget Tests:**  
  `flutter test`
- *(Add more tests in the `test/` directory as needed)*

---

## 📦 Key Dependencies

- `flutter`
- `google_fonts`
- `shared_preferences`
- `flip_card`
- `flutter_screenutil`
- `get_it`
- `firebase_core` and related Firebase packages

---

## 🎨 Customization

- **App Icons:** Configured via `flutter_launcher_icons.yaml`
- **Splash Screen:** Configured via `flutter_native_splash.yaml`
- **Themes:** Customize in `lib/app_core/theme/`

---

## 🔧 Configuration

- **Environment Configuration:**  
  Managed in `lib/app_core/config/environment_config.dart`.
- **Build Variants:**  
  - Development: Debug mode with development configurations  
  - Production: Release mode with production configurations

---

## 🛡️ CI/CD (Continuous Integration & Deployment)

This project is ready for automated testing and deployment using CI/CD tools such as **GitHub Actions**.

### Example: GitHub Actions Workflow

```yaml
name: Flutter CI

on:
  push:
    branches: [ main, develop, feature/* ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.8.1'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --flavor dev --target lib/main_dev.dart
```

> **Tip:** Add secrets for Firebase and other sensitive files using your CI/CD provider's secret management.

---

## 🔥 Advanced Firebase Setup

- **Multiple Flavors:**  
  Each flavor (dev/prod) uses its own Firebase project and configuration files.
- **Android:**  
  - Place `google-services.json` in `android/app/src/dev/` and `android/app/src/prod/`
- **iOS:**  
  - Place `GoogleService-Info.plist` in the appropriate flavor folder (see iOS setup)
- **FlutterFire CLI:**  
  - Use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) to generate and update `firebase_options_dev.dart` and `firebase_options_prod.dart`
- **Switching Flavors:**  
  - Always use the correct `--flavor` and `--target` flags when running or building

---

## 🖼️ Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/86a6ba37-663f-4571-be0f-7816d7fab71f" width="200"/>
  <img src="https://github.com/user-attachments/assets/25e842fa-757d-4bc3-b300-cf3787772ce9" width="200"/>
  <img src="https://github.com/user-attachments/assets/b90d71e1-d682-418d-8b0e-26e33c01514b" width="200"/>
  <img src="https://github.com/user-attachments/assets/4b408d08-ac46-4561-9b7d-e62dc132ff1c" width="200"/>
  <img src="https://github.com/user-attachments/assets/3bc9b973-e29a-424e-8e32-ee312cc1d281" width="200"/>
  <img src="https://github.com/user-attachments/assets/83b3f0ab-e632-417e-bd0f-b0227c4f9b5a" width="200"/>
  <img src="https://github.com/user-attachments/assets/555b4b9d-05ec-4e46-841b-2d3aa28956ab" width="200"/>
  <img src="https://github.com/user-attachments/assets/fae5f235-26fd-42ef-96a3-25520f3020d0" width="200"/>
> 


---

## 🐛 Troubleshooting

- **Always specify the `--target` flag** for the correct flavor.
- **Dependency issues:**  
  ```bash
  flutter clean
  flutter pub get
  ```
- **Platform-specific issues:**  
  - Android: Check SDK/NDK, Gradle versions
  - iOS: Ensure Xcode is up to date, run `flutter doctor`

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

---

## 📄 License

This project is developed as part of the CodeAlpha Internship Program.

---

## 📞 Support

- Create an issue in the repository
- Contact the development team

---

**Note:**  
This project uses a multi-flavor architecture. Always specify the correct entry point when running or building the application.
