import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

/// Main application card widget with consistent styling and responsive design
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;
  final bool isClickable;
  final AppCardType type;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.isClickable = false,
    this.type = AppCardType.defaultCard,
  });

  @override
  Widget build(BuildContext context) {
    final cardDecoration = _getCardDecoration(context);
    final cardPadding = padding ?? _getDefaultPadding();
    final cardMargin = margin ?? _getDefaultMargin();

    Widget cardContent = Container(
      decoration: cardDecoration,
      padding: cardPadding,
      child: child,
    );

    if (isClickable || onTap != null) {
      cardContent = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          borderRadius ?? ScreenUtils.getRadius(12),
        ),
        child: cardContent,
      );
    }

    return Container(
      margin: cardMargin,
      child: cardContent,
    );
  }

  BoxDecoration _getCardDecoration(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? _getDefaultBorderRadius();
    final defaultElevation = elevation ?? _getDefaultElevation();
    final defaultBackgroundColor = backgroundColor ?? _getDefaultBackgroundColor(context);
    final defaultBorderColor = borderColor ?? _getDefaultBorderColor(context);
    final defaultBorderWidth = borderWidth ?? _getDefaultBorderWidth();

    return BoxDecoration(
      color: defaultBackgroundColor,
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      border: defaultBorderWidth > 0
          ? Border.all(
              color: defaultBorderColor,
              width: defaultBorderWidth,
            )
          : null,
      boxShadow: defaultElevation > 0
          ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: defaultElevation * 2,
                offset: Offset(0, defaultElevation),
              ),
            ]
          : null,
    );
  }

  EdgeInsetsGeometry _getDefaultPadding() {
    switch (type) {
      case AppCardType.defaultCard:
        return ScreenUtils.getPadding(all: 16);
      case AppCardType.compactCard:
        return ScreenUtils.getPadding(all: 12);
      case AppCardType.spaciousCard:
        return ScreenUtils.getPadding(all: 24);
      case AppCardType.listCard:
        return ScreenUtils.getPadding(
          horizontal: 16,
          vertical: 12,
        );
    }
  }

  EdgeInsetsGeometry _getDefaultMargin() {
    switch (type) {
      case AppCardType.defaultCard:
        return EdgeInsets.only(bottom: ScreenUtils.getHeight(16));
      case AppCardType.compactCard:
        return EdgeInsets.only(bottom: ScreenUtils.getHeight(8));
      case AppCardType.spaciousCard:
        return EdgeInsets.only(bottom: ScreenUtils.getHeight(24));
      case AppCardType.listCard:
        return EdgeInsets.only(bottom: ScreenUtils.getHeight(12));
    }
  }

  double _getDefaultBorderRadius() {
    switch (type) {
      case AppCardType.defaultCard:
        return ScreenUtils.getRadius(12);
      case AppCardType.compactCard:
        return ScreenUtils.getRadius(8);
      case AppCardType.spaciousCard:
        return ScreenUtils.getRadius(16);
      case AppCardType.listCard:
        return ScreenUtils.getRadius(8);
    }
  }

  double _getDefaultElevation() {
    switch (type) {
      case AppCardType.defaultCard:
        return 2;
      case AppCardType.compactCard:
        return 1;
      case AppCardType.spaciousCard:
        return 4;
      case AppCardType.listCard:
        return 1;
    }
  }

  Color _getDefaultBackgroundColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  Color _getDefaultBorderColor(BuildContext context) {
    return Theme.of(context).dividerColor;
  }

  double _getDefaultBorderWidth() {
    switch (type) {
      case AppCardType.defaultCard:
      case AppCardType.compactCard:
      case AppCardType.spaciousCard:
        return 0;
      case AppCardType.listCard:
        return 1;
    }
  }
}

/// App card type enum
enum AppCardType {
  defaultCard,
  compactCard,
  spaciousCard,
  listCard,
}

/// Predefined app card widgets for common use cases
class AppCards {
  /// Compact card for small content
  static Widget compact({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    VoidCallback? onTap,
    required Widget child,
  }) {
    return AppCard(
      type: AppCardType.compactCard,
      padding: padding,
      margin: margin,
      onTap: onTap,
      isClickable: onTap != null,
      child: child,
    );
  }

  /// Spacious card for large content
  static Widget spacious({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    VoidCallback? onTap,
    required Widget child,
  }) {
    return AppCard(
      type: AppCardType.spaciousCard,
      padding: padding,
      margin: margin,
      onTap: onTap,
      isClickable: onTap != null,
      child: child,
    );
  }

  /// List card for list items
  static Widget list({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    VoidCallback? onTap,
    required Widget child,
  }) {
    return AppCard(
      type: AppCardType.listCard,
      padding: padding,
      margin: margin,
      onTap: onTap,
      isClickable: onTap != null,
      child: child,
    );
  }
} 