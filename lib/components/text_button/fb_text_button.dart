import 'package:flutter/material.dart';

class FBTextButton extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final Color textColor;
  final double fontSize;
  final IconData? icon;
  final EdgeInsets padding;

  const FBTextButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.textColor = Colors.black,
    this.fontSize = 16,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        padding: padding,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: fontSize + 2),
            const SizedBox(width: 8),
          ],
          Text(
            texto,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
