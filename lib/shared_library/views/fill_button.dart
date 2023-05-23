import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructure/utils/utils.dart';

class FillButton extends StatelessWidget {
  final String title;
  final bool loading;
  final void Function()? onPressed;
  final ButtonStyle? style;

  const FillButton({
    required this.title,
    final Key? key,
    this.loading = false,
    this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) =>
      loading ? _disableButton() : _enableButton();

  Widget _enableButton() => ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: _buttonText(),
      );

  Widget _disableButton() => ElevatedButton(
      onPressed: null,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buttonText(),
          Utils.largeHorizontalSpace,
          _disableCircularProgress()
        ],
      ));

  Widget _disableCircularProgress() => SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Get.theme.disabledColor,
        ),
      );

  Widget _buttonText() => Text(
        title,
      );
}
