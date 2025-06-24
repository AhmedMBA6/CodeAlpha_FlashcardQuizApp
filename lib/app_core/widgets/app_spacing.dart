import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

/// Main application spacing widgets to eliminate repeated SizedBox usage
class AppSpacing {
  // Horizontal spacing
  static Widget h4() => SizedBox(width: ScreenUtils.getWidth(4));
  static Widget h8() => SizedBox(width: ScreenUtils.getWidth(8));
  static Widget h12() => SizedBox(width: ScreenUtils.getWidth(12));
  static Widget h16() => SizedBox(width: ScreenUtils.getWidth(16));
  static Widget h20() => SizedBox(width: ScreenUtils.getWidth(20));
  static Widget h24() => SizedBox(width: ScreenUtils.getWidth(24));
  static Widget h32() => SizedBox(width: ScreenUtils.getWidth(32));
  static Widget h48() => SizedBox(width: ScreenUtils.getWidth(48));
  static Widget h64() => SizedBox(width: ScreenUtils.getWidth(64));

  // Vertical spacing
  static Widget v4() => SizedBox(height: ScreenUtils.getHeight(4));
  static Widget v8() => SizedBox(height: ScreenUtils.getHeight(8));
  static Widget v12() => SizedBox(height: ScreenUtils.getHeight(12));
  static Widget v16() => SizedBox(height: ScreenUtils.getHeight(16));
  static Widget v20() => SizedBox(height: ScreenUtils.getHeight(20));
  static Widget v24() => SizedBox(height: ScreenUtils.getHeight(24));
  static Widget v32() => SizedBox(height: ScreenUtils.getHeight(32));
  static Widget v48() => SizedBox(height: ScreenUtils.getHeight(48));
  static Widget v64() => SizedBox(height: ScreenUtils.getHeight(64));

  // Custom spacing
  static Widget h(double width) => SizedBox(width: ScreenUtils.getWidth(width));
  static Widget v(double height) => SizedBox(height: ScreenUtils.getHeight(height));
}

/// Responsive spacing based on screen size
class ResponsiveSpacing {
  static Widget h({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = ScreenUtils.getResponsiveValue(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return SizedBox(width: ScreenUtils.getWidth(width));
  }

  static Widget v({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final height = ScreenUtils.getResponsiveValue(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return SizedBox(height: ScreenUtils.getHeight(height));
  }
}

/// Common spacing patterns used throughout the app
class AppSpacingPatterns {
  /// Standard list item spacing
  static Widget listItem() => AppSpacing.v16();
  
  /// Section spacing
  static Widget section() => AppSpacing.v32();
  
  /// Card spacing
  static Widget card() => AppSpacing.v16();
  
  /// Button spacing
  static Widget button() => AppSpacing.v12();
  
  /// Form field spacing
  static Widget formField() => AppSpacing.v16();
  
  /// Header spacing
  static Widget header() => AppSpacing.v24();
  
  /// Content spacing
  static Widget content() => AppSpacing.v20();
  
  /// Small spacing for tight layouts
  static Widget small() => AppSpacing.v8();
  
  /// Medium spacing for balanced layouts
  static Widget medium() => AppSpacing.v16();
  
  /// Large spacing for spacious layouts
  static Widget large() => AppSpacing.v32();
} 