import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Screen utilities for responsive design
class ScreenUtils {
  /// Initialize screen utils
  static void init(BuildContext context) {
    // Set design size (you can adjust these based on your design)
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }

  /// Get responsive width
  static double getWidth(double width) => width.w;
  
  /// Get responsive height
  static double getHeight(double height) => height.h;
  
  /// Get responsive radius
  static double getRadius(double radius) => radius.r;
  
  /// Get responsive font size
  static double getFontSize(double fontSize) => fontSize.sp;
  
  /// Get responsive padding
  static EdgeInsets getPadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      return EdgeInsets.all(all.w);
    }
    
    return EdgeInsets.only(
      left: left?.w ?? 0,
      top: top?.h ?? 0,
      right: right?.w ?? 0,
      bottom: bottom?.h ?? 0,
    );
  }
  
  /// Get responsive margin
  static EdgeInsets getMargin({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      return EdgeInsets.all(all.w);
    }
    
    return EdgeInsets.only(
      left: left?.w ?? 0,
      top: top?.h ?? 0,
      right: right?.w ?? 0,
      bottom: bottom?.h ?? 0,
    );
  }
  
  /// Get responsive size
  static Size getSize(double width, double height) => Size(width.w, height.h);
  
  /// Check if screen is small (width < 600)
  static bool isSmallScreen(BuildContext context) => 
      MediaQuery.of(context).size.width < 600;
  
  /// Check if screen is medium (600 <= width < 900)
  static bool isMediumScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 900;
  }
  
  /// Check if screen is large (width >= 900)
  static bool isLargeScreen(BuildContext context) => 
      MediaQuery.of(context).size.width >= 900;
  
  /// Get responsive value based on screen size
  static double getResponsiveValue({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isLargeScreen(context) && desktop != null) {
      return desktop;
    } else if (isMediumScreen(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }
  
  /// Get responsive padding based on screen size
  static EdgeInsets getResponsivePadding({
    required BuildContext context,
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    if (isLargeScreen(context) && desktop != null) {
      return desktop;
    } else if (isMediumScreen(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }
  
  /// Get responsive text style
  static TextStyle getResponsiveTextStyle({
    required BuildContext context,
    required TextStyle mobile,
    TextStyle? tablet,
    TextStyle? desktop,
  }) {
    if (isLargeScreen(context) && desktop != null) {
      return desktop;
    } else if (isMediumScreen(context) && tablet != null) {
      return tablet;
    }
    return mobile;
  }
} 