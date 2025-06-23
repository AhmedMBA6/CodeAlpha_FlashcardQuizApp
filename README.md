# CodeAlpha Flash Card Quiz App

This is a Flutter-based mobile app developed as part of the *CodeAlpha Internship Program*.

## 🔧 Features
- Learn words and phrases in different languages
- Daily lessons and flashcards
- Pronunciation and translation support
- Quizzes to test learning progress
- Clean and modern UI

## 📁 Project Structure
- /lib/ui – Presentation layer (pages, widgets, state)
- /lib/business_logic – Domain layer (use cases, repositories, entities)
- /lib/data_layer – Data layer (models, repositories, data sources)
- /lib/app_core – Core/shared code

## 🚀 Getting Started
```bash
fvm flutter pub get
```

### ⚡️ Important: Entry Points & Flavors
> **This project does not use a generic `main.dart`.**
>
> Instead, use the following entry points for each flavor:
> - `lib/main_dev.dart` for development
> - `lib/main_prod.dart` for production
>
> **You must always specify the `--target` flag when running or building:**

### Run with Flavors
```bash
# Run development flavor
fvm flutter run --flavor dev --target lib/main_dev.dart

# Run production flavor
fvm flutter run --flavor prod --target lib/main_prod.dart
```

### Build APKs with Flavors
```bash
# Build dev APK
fvm flutter build apk --flavor dev --target lib/main_dev.dart

# Build prod APK
fvm flutter build apk --flavor prod --target lib/main_prod.dart
```

---
**Best Practice:**
- This approach keeps your entry points explicit and avoids confusion.
- If you run `flutter run` or `flutter build` without `--target`, it will fail (by design).
- This is the recommended pattern for multi-flavor Flutter projects.

Feel free to update the features and structure as the project evolves!