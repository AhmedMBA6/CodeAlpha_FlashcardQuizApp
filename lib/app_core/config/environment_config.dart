/// Environment configuration class that provides access to build-time constants
/// and environment-specific values.
class EnvironmentConfig {
  // BuildConfig fields (set at build time)
  static const String flavorName = String.fromEnvironment('FLAVOR_NAME', defaultValue: 'unknown');
  static const bool isDev = bool.fromEnvironment('IS_DEV', defaultValue: false);
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://api.example.com');
  static const String appEnvironment = String.fromEnvironment('APP_ENVIRONMENT', defaultValue: 'production');
  static const String logLevel = String.fromEnvironment('LOG_LEVEL', defaultValue: 'error');
  static const String analyticsKey = String.fromEnvironment('ANALYTICS_KEY', defaultValue: '');

  // Computed properties
  static bool get isDevelopment => appEnvironment == 'development';
  static bool get isProduction => appEnvironment == 'production';
  static bool get isDebugMode => logLevel == 'debug';

  // Environment-specific configurations
  static const Map<String, dynamic> devConfig = {
    'apiTimeout': 30000, // 30 seconds for dev
    'retryAttempts': 3,
    'enableLogging': true,
    'enableAnalytics': false, // Disable analytics in dev
  };

  static const Map<String, dynamic> prodConfig = {
    'apiTimeout': 15000, // 15 seconds for prod
    'retryAttempts': 2,
    'enableLogging': false,
    'enableAnalytics': true, // Enable analytics in prod
  };

  /// Get current environment configuration
  static Map<String, dynamic> get currentConfig => 
      isDevelopment ? devConfig : prodConfig;

  /// Get API timeout for current environment
  static int get apiTimeout => currentConfig['apiTimeout'] as int;

  /// Get retry attempts for current environment
  static int get retryAttempts => currentConfig['retryAttempts'] as int;

  /// Check if logging is enabled
  static bool get enableLogging => currentConfig['enableLogging'] as bool;

  /// Check if analytics is enabled
  static bool get enableAnalytics => currentConfig['enableAnalytics'] as bool;

  /// Print environment information (useful for debugging)
  static void printEnvironmentInfo() {
    if (isDebugMode) {
      // ignore: avoid_print
      print('🌍 Environment Configuration:');
      // ignore: avoid_print
      print('   Flavor: $flavorName');
      // ignore: avoid_print
      print('   Environment: $appEnvironment');
      // ignore: avoid_print
      print('   API Base URL: $apiBaseUrl');
      // ignore: avoid_print
      print('   Log Level: $logLevel');
      // ignore: avoid_print
      print('   Is Dev: $isDev');
      // ignore: avoid_print
      print('   Analytics Enabled: $enableAnalytics');
    }
  }
}

/// Logger utility that respects environment configuration
class Logger {
  static void debug(String message) {
    if (EnvironmentConfig.isDebugMode) {
      // ignore: avoid_print
      print('🐛 DEBUG: $message');
    }
  }

  static void info(String message) {
    if (EnvironmentConfig.enableLogging) {
      // ignore: avoid_print
      print('ℹ️  INFO: $message');
    }
  }

  static void warning(String message) {
    if (EnvironmentConfig.enableLogging) {
      // ignore: avoid_print
      print('⚠️  WARNING: $message');
    }
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (EnvironmentConfig.enableLogging) {
      // ignore: avoid_print
      print('❌ ERROR: $message');
      if (error != null) {
        // ignore: avoid_print
        print('   Error: $error');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print('   Stack Trace: $stackTrace');
      }
    }
  }
}

/// API service example using environment configuration
class ApiService {
  static String get baseUrl => EnvironmentConfig.apiBaseUrl;
  static int get timeout => EnvironmentConfig.apiTimeout;
  static int get maxRetries => EnvironmentConfig.retryAttempts;

  static Future<Map<String, dynamic>> get(String endpoint) async {
    Logger.debug('Making API call to: $baseUrl$endpoint');
    
    // Simulate API call
    await Future.delayed(Duration(milliseconds: timeout));
    
    return {
      'success': true,
      'data': 'Sample data from $endpoint',
      'environment': EnvironmentConfig.appEnvironment,
    };
  }

  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    Logger.debug('Making POST request to: $baseUrl$endpoint with data: $data');
    
    // Simulate API call
    await Future.delayed(Duration(milliseconds: timeout));
    
    return {
      'success': true,
      'data': 'Data posted to $endpoint',
      'environment': EnvironmentConfig.appEnvironment,
    };
  }
}

/// Analytics service example using environment configuration
class AnalyticsService {
  static String get key => EnvironmentConfig.analyticsKey;
  static bool get enabled => EnvironmentConfig.enableAnalytics;

  static void trackEvent(String eventName, Map<String, dynamic> parameters) {
    if (!enabled) {
      Logger.debug('Analytics disabled - skipping event: $eventName');
      return;
    }

    Logger.debug('Tracking event: $eventName with parameters: $parameters');
    // In real app, you would send this to your analytics service
    // analytics.track(eventName, properties: parameters);
  }

  static void trackScreenView(String screenName) {
    trackEvent('screen_view', {'screen_name': screenName});
  }

  static void trackButtonClick(String buttonName) {
    trackEvent('button_click', {'button_name': buttonName});
  }
} 