import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/feature/auth_features/provider/hide_password_provider.dart'; // Import provider package

class CustomTextFormField extends StatelessWidget {
  final int? maxline;
  final int? maxLength;
  final double? height;
  final double? hintSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final EdgeInsetsGeometry? contentPadding;
  final String? hint;
  final String? labelText;
  final String? initialValue;
  final bool? obscureText;
  final bool filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintColor;
  final Color? inputColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? textStyle;
  final TextStyle? errorTextStyle;
  final InputDecoration? customDecoration;
  final String? semanticLabel;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? controller;
  final ValidationType? validationType;
  final bool isPassword; // New parameter

  const CustomTextFormField({
    super.key,
    this.maxline,
    this.maxLength,
    this.height,
    this.hintSize,
    this.fontWeight,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.contentPadding,
    this.hint,
    this.labelText,
    this.initialValue,
    this.obscureText,
    this.filled = true,
    this.isCollapsed,
    this.isDense,
    this.isEnabled,
    this.readOnly,
    this.fillColor,
    this.hintColor,
    this.inputColor,
    this.borderColor,
    this.focusBorderColor,
    this.cursorColor,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.keyboardType,
    this.inputAction,
    this.autoValidateMode,
    this.textStyle,
    this.errorTextStyle,
    this.customDecoration,
    this.semanticLabel,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.controller,
    this.validationType,
    this.isPassword = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        isPassword ? Provider.of<PasswordVisibilityProvider>(context) : null;

    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: maxLength,
        obscureText: isPassword
            ? passwordProvider?.isObscure ?? true
            : (obscureText ?? false),
        cursorColor: cursorColor,
        maxLines: (isPassword
                ? passwordProvider?.isObscure ?? true
                : (obscureText ?? false))
            ? 1
            : (maxline ?? 1),
        textInputAction: inputAction,
        initialValue: initialValue,
        style: textStyle,
        autofocus: false,
        keyboardType: keyboardType,
        onChanged: onChanged,
        inputFormatters: inputFormatters ?? _getInputFormatters(),
        autovalidateMode: autoValidateMode,
        readOnly: readOnly ?? false,
        enabled: isEnabled ?? true,
        decoration: customDecoration ??
            InputDecoration(
              labelText: labelText,
              counterText: '',
              hintText: hint,
              hintStyle: TextStyle(
                  color: hintColor ?? colorScheme(context).onSurface,
                  fontSize: hintSize ?? 12,
                  fontWeight: fontWeight ?? FontWeight.w400),
              filled: filled,
              fillColor: fillColor ?? Colors.white,
              prefixIcon: prefixIcon,
              suffixIcon: isPassword
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            passwordProvider?.isObscure ?? true
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            passwordProvider?.toggleVisibility();
                          },
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: borderColor ??
                              colorScheme(context).outline.withOpacity(0.4),
                        ),
                      ],
                    )
                  : suffixIcon,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? 20.0,
                    vertical: verticalPadding ?? 10,
                  ),
              errorStyle: errorTextStyle ?? const TextStyle(color: Colors.red),
              errorMaxLines: 2,
              isCollapsed: isCollapsed ?? false,
              isDense: isDense,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ??
                      colorScheme(context).outline.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusBorderColor ??
                      colorScheme(context).outline.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ??
                      colorScheme(context).outline.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
            ),
        validator: (value) => _validateInput(value),
        onFieldSubmitted: onFieldSubmitted,
        onTapOutside: onTapOutside ??
            (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
      ),
    );
  }

  String? _validateInput(String? value) {
    if (validationType == null || validationType == ValidationType.none) {
      return null; // No validation required
    }

    switch (validationType) {
      case ValidationType.email:
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (!emailRegex.hasMatch(value)) {
          return 'Enter a valid email';
        }
        break;

      case ValidationType.password:
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        break;

      case ValidationType.phoneNumber:
        final phoneRegex = RegExp(r'^\d{10}$');
        if (value == null || value.isEmpty) {
          return 'Phone number is required';
        } else if (!phoneRegex.hasMatch(value)) {
          return 'Enter a valid 10-digit phone number';
        }
        break;

      case ValidationType.cnic:
        final cnicRegex = RegExp(r'^\d{13}$');
        if (value == null || value.isEmpty) {
          return 'CNIC is required';
        } else if (!cnicRegex.hasMatch(value)) {
          return 'Enter a valid 13-digit CNIC';
        }
        break;

      case ValidationType.url:
        final urlRegex = RegExp(r'^(http|https):\/\/[^\s$.?#].[^\s]*$');
        if (value == null || value.isEmpty) {
          return 'URL is required';
        } else if (!urlRegex.hasMatch(value)) {
          return 'Enter a valid URL';
        }
        break;

      case ValidationType.number:
        if (value == null || value.isEmpty) {
          return 'Number is required';
        } else if (double.tryParse(value) == null) {
          return 'Enter a valid number';
        }
        break;

      default:
        break;
    }

    return null; // No errors
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (validationType == ValidationType.phoneNumber ||
        validationType == ValidationType.cnic) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return null; // No formatters required
  }
}

enum ValidationType {
  none,
  email,
  password,
  phoneNumber,
  cnic,
  url,
  number,
}
