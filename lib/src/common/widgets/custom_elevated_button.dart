import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final VoidCallback onPressed;
  final IconData? icon; // Optional icon parameter
  final double? iconSize; // Optional icon size parameter
  final Color? iconColor; // Optional icon color parameter

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.buttonColor,
    this.textStyle,
    this.borderRadius = 10.0,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            buttonColor ?? const Color(0xff21879D),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize ?? 20,
                color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle ??
                  GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
