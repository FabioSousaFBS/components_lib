import 'package:components_lib/components/text_form_field/fb_text_form_field.dart';
import 'package:components_lib/styles/colors.dart';
import 'package:components_lib/utils/date_input_formatter_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ManualOrPickerDateField extends StatefulWidget {
  final Function(String)? onDateSelected;
  final TextEditingController controller;
  final String? labelText;
  final bool? monthYearPicker;
  const ManualOrPickerDateField({
    super.key,
    this.onDateSelected,
    this.labelText,
    required this.controller,
    this.monthYearPicker = false,
  });

  @override
  _ManualOrPickerDateFieldState createState() =>
      _ManualOrPickerDateFieldState();
}

class _ManualOrPickerDateFieldState extends State<ManualOrPickerDateField> {
  late final TextEditingController _controller;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  DateTime? _selectedDate;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _pickDate() async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    late DateTime? picked;

    if (widget.monthYearPicker == true) {
      picked = await showMonthYearPicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        useRootNavigator: true, // evita rebuilds de navegadores aninhados
        builder: (context, child) {
          final theme = Theme.of(context);
          return Theme(
            data: theme.copyWith(
              // Se quiser reforçar cores específicas só pro diálogo:
              colorScheme: theme.colorScheme.copyWith(
                primary: AppColorsFB.primary,
                onPrimary: AppColorsFB.buttonText,
                surface: Colors.white,
                onSurface: Colors.black87,
              ),
              dialogTheme: theme.dialogTheme.copyWith(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColorsFB.primary,
                ),
              ),
            ),
            child: child!,
          );
        },
      );
    } else {
      picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
    }

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _dateFormat.format(picked!);
        widget.onDateSelected?.call(_controller.text);
      });
    }
  }

  void _parseTextInput(String value) {
    try {
      final DateTime parsed = _dateFormat.parseStrict(value);
      setState(() => _selectedDate = parsed);
      widget.onDateSelected?.call(value);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return FBTextFormField(
      controller: _controller,
      labelText: widget.labelText,
      hintText: widget.monthYearPicker! ? 'mm/aaaa' : 'dd/mm/aaaa',
      iconeDireita: Icons.calendar_today,
      obscureText: false,
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d+[/]*')),
        LengthLimitingTextInputFormatter(10),
        DateInputFormatter(),
      ],
      onChanged: _parseTextInput,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        _pickDate();
      },
      validator: (value) {
        if (value == null || value.isEmpty)
          return 'Informe uma data'; //TODO: i18n
        try {
          _dateFormat.parseStrict(value);
          return null;
        } catch (e) {
          return 'Data inválida'; //TODO: i18n
        }
      },
    );
  }
}
