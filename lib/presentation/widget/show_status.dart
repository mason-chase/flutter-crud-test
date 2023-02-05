import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';
import 'package:mc_crud_test/presentation/widget/multiple_container_on_top_each_other.dart';

class ShowStatus extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final bool isError;
  final double? iconSize;

  const ShowStatus({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconSize,
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ThemeConfig.appHorizontalPadding.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MultipleContainerOnTopEachOther(
            biggestContainerSize: 0.45.sw,
            centerIcon: icon,
            centerIconPadding: iconSize ?? 40,
            iconColor: Colors.white,
            colors: isError
                ? [
                    Colory.dangerColor.shade400.withOpacity(0.1),
                    Colory.dangerColor.shade400.withOpacity(0.2),
                    Colory.dangerColor.shade400,
                  ]
                : [
                    Colory.primaryColor.shade400.withOpacity(0.1),
                    Colory.primaryColor.shade400.withOpacity(0.2),
                    Colory.primaryColor.shade400,
                  ],
          ),
          const SizedBox(height: 26),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
