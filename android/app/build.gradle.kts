plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.bauiomy.codealphaflashcard"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.bauiomy.codealphaflashcard"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
        
        // Default app name (will be overridden by flavors)
        resValue("string", "app_name", "CodeAlpha Flashcard")
        
        // Default BuildConfig fields
        buildConfigField("String", "FLAVOR_NAME", "\"default\"")
        buildConfigField("boolean", "IS_DEV", "false")
        buildConfigField("String", "API_BASE_URL", "\"https://api.example.com\"")
        buildConfigField("String", "APP_ENVIRONMENT", "\"production\"")
        buildConfigField("String", "LOG_LEVEL", "\"error\"")
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += listOf("default")
    productFlavors {
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            
            // Flavor-specific resources
            resValue("string", "app_name", "CodeAlpha Flashcard (Dev)")
            resValue("string", "app_description", "Development version of CodeAlpha Flashcard")
            resValue("color", "primary_color", "#FF6200EE") // Purple for dev
            
            // Environment-specific resources
            resValue("string", "api_base_url", "https://dev-api.example.com")
            resValue("string", "app_environment", "development")
            resValue("string", "log_level", "debug")
            resValue("color", "accent_color", "#FF00FF") // Different accent for dev
            
            // BuildConfig fields
            buildConfigField("String", "FLAVOR_NAME", "\"dev\"")
            buildConfigField("boolean", "IS_DEV", "true")
            buildConfigField("String", "API_BASE_URL", "\"https://dev-api.example.com\"")
            buildConfigField("String", "APP_ENVIRONMENT", "\"development\"")
            buildConfigField("String", "LOG_LEVEL", "\"debug\"")
            buildConfigField("String", "ANALYTICS_KEY", "\"dev-analytics-key\"")
        }
        create("prod") {
            dimension = "default"
            
            // Production-specific resources
            resValue("string", "app_name", "CodeAlpha Flashcard")
            resValue("string", "app_description", "CodeAlpha Flashcard Quiz App")
            resValue("color", "primary_color", "#FF6200EE") // Purple for prod
            
            // Environment-specific resources
            resValue("string", "api_base_url", "https://api.example.com")
            resValue("string", "app_environment", "production")
            resValue("string", "log_level", "error")
            resValue("color", "accent_color", "#6200EE") // Production accent
            
            // BuildConfig fields
            buildConfigField("String", "FLAVOR_NAME", "\"prod\"")
            buildConfigField("boolean", "IS_DEV", "false")
            buildConfigField("String", "API_BASE_URL", "\"https://api.example.com\"")
            buildConfigField("String", "APP_ENVIRONMENT", "\"production\"")
            buildConfigField("String", "LOG_LEVEL", "\"error\"")
            buildConfigField("String", "ANALYTICS_KEY", "\"prod-analytics-key\"")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.google.android.material:material:1.11.0")
}