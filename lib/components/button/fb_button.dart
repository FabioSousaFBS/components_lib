// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FBButton extends StatelessWidget {
  final String texto;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double fontSize;
  final Color? backgroundColorPrimary;
  final Color? backgroundColorSecundary;
  final Color? textColor;
  final EdgeInsets padding;

  const FBButton({
    super.key,
    required this.texto,
    this.isLoading = false,
    required this.onPressed,
    this.borderRadius = 10,
    this.fontSize = 16,
    this.backgroundColorPrimary,
    this.backgroundColorSecundary,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  });

  const FBButton.botaoVermelho({
    super.key,
    required this.texto,
    required this.onPressed,
    this.isLoading = false,
    this.borderRadius = 10,
    this.fontSize = 16,
    this.backgroundColorPrimary = const Color.fromARGB(255, 185, 15, 3),
    this.backgroundColorSecundary = const Color.fromARGB(255, 243, 86, 75),
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  });

  const FBButton.botaoCinzaEscuro({
    super.key,
    required this.texto,
    required this.onPressed,
    this.isLoading = false,
    this.borderRadius = 10,
    this.fontSize = 16,
    this.backgroundColorPrimary = const Color(0xFF5B5959),
    this.backgroundColorSecundary = const Color(0xff898484),
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColorPrimary ?? Colors.red,
            backgroundColorSecundary ?? Colors.red,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.grey.shade400,
          disabledForegroundColor: Colors.grey.shade200,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: fontSize + 4,
                width: fontSize + 4,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              )
            : Text(
                texto,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
