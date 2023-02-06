import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndDescriptionColumn extends StatelessWidget {
  final String title;
  final String? description;
  final TextAlign textAlign;

  const TitleAndDescriptionColumn({
    Key? key,
    required this.title,
    this.textAlign = TextAlign.start,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign:textAlign,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (description != null)
            Text(
              description!,
              textAlign: textAlign,
              style: Theme.of(context).textTheme.titleSmall,
            )
        ],
      ),
    );
  }
}
