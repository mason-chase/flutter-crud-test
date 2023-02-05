import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/widget/label.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_text_field_container.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_text_field_error.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_text_field_suffix.dart';

enum TextFieldSize { small, medium, big }

class CustomFormTextField extends StatefulWidget {
  final ValueChanged<String> onChange;
  final ValueChanged<String?>? onSave;
  final ValueChanged<String?>? onSubmit;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final EdgeInsets? outterPadding;
  final int? maxLength;
  final TextStyle? textStyle;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final List<TextInputFormatter>? inputFormatter;
  final String? title;
  final Color? fillColor;
  final double borderRadius;
  final int maxLine;
  final Color cursorColor;
  final TextAlign textAlign;
  final bool enabled;
  final bool autoFocus;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextFieldSize size;
  final bool haveClearButton;
  final String? hint;
  final String? prefixIcon;

  const CustomFormTextField({
    Key? key,
    required this.onChange,
    this.onSave,
    this.onSubmit,
    this.validator,
    this.outterPadding,
    this.maxLength,
    this.textStyle,
    this.currentFocusNode,
    this.nextFocusNode,
    this.inputFormatter,
    this.title,
    this.fillColor,
    this.initialValue,
    this.haveClearButton = true,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.autoFocus = false,
    this.enabled = true,
    this.borderRadius = 32,
    this.cursorColor = Colors.black,
    this.textAlign = TextAlign.left,
    this.maxLine = 1,
    this.obscureText = false,
    this.size = TextFieldSize.medium,
    this.hint,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  late final TextEditingController _controller;
  String _text = '';
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.outterPadding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 1.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(widget.title),
          CustomTextFieldContainer(
            fillColor: widget.fillColor,
            borderRadius: widget.borderRadius,
            isError: _errorMessage != null,
            child: Directionality(
              textDirection:
                  widget.textAlign == TextAlign.left ? TextDirection.ltr : TextDirection.rtl,
              child: TextFormField(
                controller: _controller,
                maxLines: widget.maxLine,
                toolbarOptions:
                    const ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
                style: widget.textStyle ?? Theme.of(context).textTheme.headlineLarge,
                cursorColor: widget.cursorColor,
                textAlign: widget.textAlign,
                textDirection:
                    widget.textAlign == TextAlign.left ? TextDirection.ltr : TextDirection.rtl,
                enabled: widget.enabled,
                autofocus: widget.autoFocus,
                autocorrect: false,
                focusNode: widget.currentFocusNode,
                validator: (value) {
                  if (widget.validator != null) {
                    final res = widget.validator!(value);
                    setState(() {
                      _errorMessage = res;
                    });
                    return res;
                  }
                  return null;
                },
                keyboardType: widget.textInputType,
                textInputAction:
                    widget.nextFocusNode == null ? widget.textInputAction : TextInputAction.next,
                onChanged: (value) {
                  if (value != _text) {
                    _text = value;
                    widget.onChange(value);
                  }
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(widget.maxLength),
                  if (widget.textInputType == TextInputType.number)
                    FilteringTextInputFormatter.digitsOnly,
                  if (widget.inputFormatter != null) ...widget.inputFormatter!
                ],
                cursorRadius: const Radius.circular(50),
                onSaved: widget.onSave,
                obscureText: widget.obscureText,
                onFieldSubmitted: (value) {
                  if (widget.nextFocusNode != null) {
                    widget.nextFocusNode!.requestFocus();
                  } else {
                    widget.currentFocusNode?.unfocus();
                    if (widget.onSubmit != null) {
                      widget.onSubmit!(value);
                    }
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hint,
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: _getTextFiledSize(),
                  ),
                  suffixIcon: widget.haveClearButton
                      ? CustomTextFieldSuffix(controller: _controller, onChange: widget.onChange)
                      : null,
                  prefixIcon: widget.prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            widget.prefixIcon!,
                            color: Colory.neutralColor.shade400,
                          ),
                        )
                      : null,
                  errorStyle: const TextStyle(fontSize: 0, height: 1),
                  errorText: '',
                  filled: false,
                ),
              ),
            ),
          ),
          CustomTextFieldError(_errorMessage),
        ],
      ),
    );
  }

  double _getTextFiledSize() {
    switch (widget.size) {
      case TextFieldSize.small:
        return 12.h;
      case TextFieldSize.medium:
        return 16.h;
      case TextFieldSize.big:
        return 22.h;
    }
  }
}
