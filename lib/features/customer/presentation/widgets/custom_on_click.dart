import 'package:flutter/material.dart';

class OnClick extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const OnClick({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: child,
    );
  }
}
