import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? backgroundColor;
  final IconData? icon;
  final Color? iconColor;
  final double radius;

  const CustomBackButton({
    Key? key,
    required this.onTap,
    this.backgroundColor,
    this.icon = Icons.arrow_back_ios_new,
    this.iconColor,
    this.radius = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
        child: Icon(
          icon,
          color: iconColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}