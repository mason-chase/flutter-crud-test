import 'package:flutter/material.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';

Future<T?> showSimpleDialog<T extends Object?>({
  required BuildContext context,
  required Widget dialog,
  Color? barrierColor,
}) {
  return showDialog<T?>(
    context: context,
    barrierDismissible: true,
    barrierColor: barrierColor ?? Colory.neutralColor.withOpacity(0.7),
    builder: (_) => dialog,
  );
}
