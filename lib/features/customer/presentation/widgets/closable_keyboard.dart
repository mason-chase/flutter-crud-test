import 'package:flutter/material.dart';

class ClosableKeyBoard extends StatelessWidget {
  final Widget child;

  const ClosableKeyBoard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => close(context),
      child: child,
    );
  }

  static void close(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }
}
