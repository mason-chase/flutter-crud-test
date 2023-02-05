import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_button/hero_button.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/widget/label.dart';

class ButtonWithLabel extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String data;

  const ButtonWithLabel({
    Key? key,
    required this.onPressed,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title),
          HeroButton(
            onPressed: onPressed,
            buttonColor: Colory.neutralColor.shade100.withOpacity(0.6),
            borderColor: Colory.neutralColor.shade200,
            childColor: Colors.black,
            textStyle: Theme.of(context).textTheme.titleMedium,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(data),
            ),
          ),
        ],
      ),
    );
  }
}
