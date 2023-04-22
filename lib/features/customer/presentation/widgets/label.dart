import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/presentation/theme/app.color.dart';

class Label extends StatelessWidget {
  final String? title;

  const Label(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.neutralColor.shade600,
                  ),
            ),
          )
        : const SizedBox.shrink();
  }
}
