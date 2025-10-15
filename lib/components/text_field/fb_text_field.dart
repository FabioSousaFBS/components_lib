import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FBTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool bordaVisivel;
  final IconData? iconeEsqueda;
  final IconData? iconeDireita;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final bool readOnly;

  const FBTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.bordaVisivel,
    this.iconeEsqueda,
    this.iconeDireita,
    this.obscureText,
    this.inputFormatters,
    this.onTap,
    this.readOnly = false,
  });

  @override
  State<FBTextField> createState() => _SPSPTextFieldState();
}

class _SPSPTextFieldState extends State<FBTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly,
      controller: widget.controller ?? TextEditingController(),
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.iconeEsqueda != null
            ? Icon(widget.iconeEsqueda, color: Colors.grey)
            : null,
        suffixIcon: widget.iconeDireita != null
            ? Icon(widget.iconeDireita, color: Colors.grey)
            : null,
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: widget.bordaVisivel
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
      ),
      onTap: widget.onTap,
    );
  }
}
