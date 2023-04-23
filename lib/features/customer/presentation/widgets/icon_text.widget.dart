import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mc_crud_test/features/customer/presentation/theme/app.color.dart';

class IconText extends StatelessWidget {
  const IconText({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon, color: AppColors.warningColor.shade400),
          const SizedBox(width: 8),
          Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                ),
          ),

        ],
      ),
    );
  }
}
