import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputAction action;
  final TextInputType? type;
  final bool isPassword;
  final int line;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  const CustomInput({
    Key? key,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
    this.hint,
    this.line = 1,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: action,
        keyboardType: type,
        maxLines: line,
        maxLength: maxLength,
        obscureText: isPassword,
        cursorHeight: 20,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          counterText: "",
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          hintText: hint,
          fillColor: Colors.grey.withOpacity(0.1),
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xffAAAAAA),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
      ),
    );
  }
}
