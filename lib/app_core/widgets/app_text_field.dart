import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

/// Main application text field widget with consistent styling and responsive design
class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final AppTextFieldType type;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;

  const AppTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.type = AppTextFieldType.defaultField,
    this.contentPadding,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      maxLength: maxLength,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      decoration: _getInputDecoration(context),
    );
  }

  InputDecoration _getInputDecoration(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? _getDefaultBorderRadius();
    final defaultBorderColor = borderColor ?? _getDefaultBorderColor(context);
    final defaultFocusedBorderColor = focusedBorderColor ?? _getDefaultFocusedBorderColor(context);
    final defaultErrorBorderColor = errorBorderColor ?? _getDefaultErrorBorderColor(context);
    final defaultContentPadding = contentPadding ?? _getDefaultContentPadding();

    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: _getDefaultFilled(),
      fillColor: _getDefaultFillColor(context),
      contentPadding: defaultContentPadding,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide(
          color: defaultBorderColor,
          width: _getDefaultBorderWidth(),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide(
          color: defaultBorderColor,
          width: _getDefaultBorderWidth(),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide(
          color: defaultFocusedBorderColor,
          width: _getDefaultFocusedBorderWidth(),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide(
          color: defaultErrorBorderColor,
          width: _getDefaultBorderWidth(),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide(
          color: defaultErrorBorderColor,
          width: _getDefaultFocusedBorderWidth(),
        ),
      ),
      labelStyle: _getLabelStyle(context),
      hintStyle: _getHintStyle(context),
      errorStyle: _getErrorStyle(context),
    );
  }

  double _getDefaultBorderRadius() {
    switch (type) {
      case AppTextFieldType.defaultField:
        return ScreenUtils.getRadius(8);
      case AppTextFieldType.roundedField:
        return ScreenUtils.getRadius(25);
      case AppTextFieldType.compactField:
        return ScreenUtils.getRadius(4);
    }
  }

  Color _getDefaultBorderColor(BuildContext context) {
    return Theme.of(context).dividerColor;
  }

  Color _getDefaultFocusedBorderColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  Color _getDefaultErrorBorderColor(BuildContext context) {
    return Theme.of(context).colorScheme.error;
  }

  double _getDefaultBorderWidth() {
    return 1;
  }

  double _getDefaultFocusedBorderWidth() {
    return 2;
  }

  bool _getDefaultFilled() {
    switch (type) {
      case AppTextFieldType.defaultField:
        return true;
      case AppTextFieldType.roundedField:
        return true;
      case AppTextFieldType.compactField:
        return false;
    }
  }

  Color _getDefaultFillColor(BuildContext context) {
    switch (type) {
      case AppTextFieldType.defaultField:
        return Theme.of(context).colorScheme.surface;
      case AppTextFieldType.roundedField:
        return Theme.of(context).colorScheme.surface;
      case AppTextFieldType.compactField:
        return Colors.transparent;
    }
  }

  EdgeInsetsGeometry _getDefaultContentPadding() {
    switch (type) {
      case AppTextFieldType.defaultField:
        return ScreenUtils.getPadding(
          horizontal: 16,
          vertical: 12,
        );
      case AppTextFieldType.roundedField:
        return ScreenUtils.getPadding(
          horizontal: 20,
          vertical: 16,
        );
      case AppTextFieldType.compactField:
        return ScreenUtils.getPadding(
          horizontal: 12,
          vertical: 8,
        );
    }
  }

  TextStyle _getLabelStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: ScreenUtils.getFontSize(14),
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
    ) ?? TextStyle(
      fontSize: ScreenUtils.getFontSize(14),
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
    );
  }

  TextStyle _getHintStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: ScreenUtils.getFontSize(14),
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
    ) ?? TextStyle(
      fontSize: ScreenUtils.getFontSize(14),
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
    );
  }

  TextStyle _getErrorStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: ScreenUtils.getFontSize(12),
      color: Theme.of(context).colorScheme.error,
    ) ?? TextStyle(
      fontSize: ScreenUtils.getFontSize(12),
      color: Theme.of(context).colorScheme.error,
    );
  }
}

/// App text field type enum
enum AppTextFieldType {
  defaultField,
  roundedField,
  compactField,
}

/// Predefined app text field widgets for common use cases
class AppTextFields {
  /// Search field with search icon
  static Widget search({
    required TextEditingController controller,
    required ValueChanged<String> onChanged,
    String? hintText,
    VoidCallback? onTap,
  }) {
    return AppTextField(
      controller: controller,
      hintText: hintText ?? 'Search...',
      onChanged: onChanged,
      onTap: onTap,
      type: AppTextFieldType.roundedField,
      prefixIcon: Icon(
        Icons.search,
        size: ScreenUtils.getWidth(20),
        color: Colors.grey[600],
      ),
      keyboardType: TextInputType.text,
    );
  }

  /// Email field with email icon
  static Widget email({
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    FormFieldValidator<String>? validator,
  }) {
    return AppTextField(
      controller: controller,
      labelText: labelText ?? 'Email',
      hintText: hintText ?? 'Enter your email',
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        Icons.email,
        size: ScreenUtils.getWidth(20),
        color: Colors.grey[600],
      ),
    );
  }

  /// Password field with visibility toggle
  static Widget password({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    String? labelText,
    String? hintText,
    FormFieldValidator<String>? validator,
  }) {
    return AppTextField(
      controller: controller,
      labelText: labelText ?? 'Password',
      hintText: hintText ?? 'Enter your password',
      validator: validator,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(
        Icons.lock,
        size: ScreenUtils.getWidth(20),
        color: Colors.grey[600],
      ),
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          size: ScreenUtils.getWidth(20),
          color: Colors.grey[600],
        ),
        onPressed: onToggleVisibility,
      ),
    );
  }

  /// Compact field for small spaces
  static Widget compact({
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
  }) {
    return AppTextField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      type: AppTextFieldType.compactField,
    );
  }
} 