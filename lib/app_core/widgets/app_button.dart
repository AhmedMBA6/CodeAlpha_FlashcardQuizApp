import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

/// Main application button widget with consistent styling and responsive design
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppButtonType type;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final EdgeInsetsGeometry? customPadding;
  final double? customBorderRadius;
  final Color? customColor;
  final Color? customTextColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.customPadding,
    this.customBorderRadius,
    this.customColor,
    this.customTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle(context);
    final buttonSize = _getButtonSize();

    Widget buttonContent = _buildButtonContent(context);

    if (isFullWidth) {
      buttonContent = SizedBox(
        width: double.infinity,
        child: buttonContent,
      );
    }

    return SizedBox(
      height: buttonSize.height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: buttonStyle,
        child: buttonContent,
      ),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: ScreenUtils.getWidth(20),
        height: ScreenUtils.getWidth(20),
        child: CircularProgressIndicator(
          strokeWidth: ScreenUtils.getWidth(2),
          valueColor: AlwaysStoppedAnimation<Color>(
            customTextColor ?? _getTextColor(context),
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: _getIconSize(),
            color: customTextColor ?? _getTextColor(context),
          ),
          SizedBox(width: ScreenUtils.getWidth(8)),
          Text(
            text,
            style: _getTextStyle(context),
          ),
        ],
      );
    }

    return Text(
      text,
      style: _getTextStyle(context),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final backgroundColor = customColor ?? _getBackgroundColor(context);
    final borderRadius = customBorderRadius ?? ScreenUtils.getRadius(8);

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: customTextColor ?? _getTextColor(context),
      elevation: _getElevation(),
      padding: customPadding ?? _getButtonPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      disabledBackgroundColor: backgroundColor.withValues(alpha: 0.5),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (type) {
      case AppButtonType.primary:
        return Theme.of(context).primaryColor;
      case AppButtonType.secondary:
        return Theme.of(context).colorScheme.secondary;
      case AppButtonType.outline:
        return Colors.transparent;
      case AppButtonType.danger:
        return Colors.red;
      case AppButtonType.success:
        return Colors.green;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (type) {
      case AppButtonType.primary:
      case AppButtonType.secondary:
      case AppButtonType.danger:
      case AppButtonType.success:
        return Colors.white;
      case AppButtonType.outline:
        return Theme.of(context).primaryColor;
    }
  }

  double _getElevation() {
    switch (type) {
      case AppButtonType.primary:
      case AppButtonType.secondary:
      case AppButtonType.danger:
      case AppButtonType.success:
        return 2;
      case AppButtonType.outline:
        return 0;
    }
  }

  EdgeInsetsGeometry _getButtonPadding() {
    switch (size) {
      case AppButtonSize.small:
        return ScreenUtils.getPadding(
          horizontal: 16,
          vertical: 8,
        );
      case AppButtonSize.medium:
        return ScreenUtils.getPadding(
          horizontal: 24,
          vertical: 12,
        );
      case AppButtonSize.large:
        return ScreenUtils.getPadding(
          horizontal: 32,
          vertical: 16,
        );
    }
  }

  AppButtonSizeData _getButtonSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppButtonSizeData(
          height: ScreenUtils.getHeight(36),
          fontSize: ScreenUtils.getFontSize(12),
          iconSize: ScreenUtils.getWidth(16),
        );
      case AppButtonSize.medium:
        return AppButtonSizeData(
          height: ScreenUtils.getHeight(48),
          fontSize: ScreenUtils.getFontSize(14),
          iconSize: ScreenUtils.getWidth(20),
        );
      case AppButtonSize.large:
        return AppButtonSizeData(
          height: ScreenUtils.getHeight(56),
          fontSize: ScreenUtils.getFontSize(16),
          iconSize: ScreenUtils.getWidth(24),
        );
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    final buttonSize = _getButtonSize();
    return Theme.of(context).textTheme.labelLarge?.copyWith(
      fontSize: buttonSize.fontSize,
      fontWeight: FontWeight.w600,
      color: customTextColor ?? _getTextColor(context),
    ) ?? TextStyle(
      fontSize: buttonSize.fontSize,
      fontWeight: FontWeight.w600,
      color: customTextColor ?? _getTextColor(context),
    );
  }

  double _getIconSize() {
    return _getButtonSize().iconSize;
  }
}

/// App button type enum
enum AppButtonType {
  primary,
  secondary,
  outline,
  danger,
  success,
}

/// App button size enum
enum AppButtonSize {
  small,
  medium,
  large,
}

/// App button size data class
class AppButtonSizeData {
  final double height;
  final double fontSize;
  final double iconSize;

  AppButtonSizeData({
    required this.height,
    required this.fontSize,
    required this.iconSize,
  });
} 