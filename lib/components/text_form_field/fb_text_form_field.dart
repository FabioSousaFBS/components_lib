import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FBTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String hintText;
  final IconData? iconeEsqueda;
  final IconData? iconeDireita;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;

  const FBTextFormField({
    super.key,
    this.controller,
    this.labelText,
    required this.hintText,
    this.iconeEsqueda,
    this.iconeDireita,
    this.obscureText,
    this.inputFormatters,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onTap,
    this.keyboardType,
  });

  @override
  State<FBTextFormField> createState() => _SPSPTextFormFieldState();
}

class _SPSPTextFormFieldState extends State<FBTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            widget.labelText ?? '',
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller ?? TextEditingController(),
          obscureText: widget.obscureText ?? false,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
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
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              widget.errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
