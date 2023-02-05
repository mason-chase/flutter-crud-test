import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';

class CustomTextFieldSuffix extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChange;

  const CustomTextFieldSuffix({
    Key? key,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  State<CustomTextFieldSuffix> createState() => _CustomTextFieldSuffixState();
}

class _CustomTextFieldSuffixState extends State<CustomTextFieldSuffix> {
  TextEditingController get controller => widget.controller;
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        if (_isEmpty) {
          setState(() {
            _isEmpty = false;
          });
        }
      } else {
        if (!_isEmpty) {
          setState(() {
            _isEmpty = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: !_isEmpty
          ? IconButton(
              onPressed: () {
                controller.clear();
                widget.onChange('');
              },
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                Icony.closeCircleBold,
                color: Colory.neutralColor.shade400,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
