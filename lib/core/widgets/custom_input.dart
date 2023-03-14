import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.onChange,
    this.placeholder = '',
    this.inputType = TextInputType.name,
    this.maxLength = 128,
    this.onTap,
    this.textAlign = TextAlign.center,
    this.readOnly = false,
    this.validator,
    this.controller,
  }) : super(key: key);
  final String placeholder;
  final TextInputType inputType;
  final bool readOnly;
  final int maxLength;
  final TextAlign textAlign;
  final Function(String t)? onChange;
  final Function()? onTap;
  final String? Function(String? t)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => _input(context);

  Widget _input(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          onChanged: onChange,
          readOnly: readOnly,
          onTap: onTap,
          textAlign: textAlign,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            counterText: '',
            disabledBorder: _baseBorderStyle(),
            errorBorder: _baseBorderStyle(error: true),
            enabledBorder: _baseBorderStyle(),
            focusedBorder: _baseBorderStyle(),
            focusedErrorBorder: _baseBorderStyle(error: true),
            fillColor: Colors.grey.shade100,
            hintText: placeholder,
          ),
          keyboardType: inputType,
          maxLength: maxLength,
          cursorHeight: 20,
          cursorWidth: 1.75,
        ),
      );
}

OutlineInputBorder _baseBorderStyle({bool error = false}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        9,
      ),
      borderSide:
          BorderSide(color: error ? Colors.red : Colors.grey, width: 1.2),
    );
