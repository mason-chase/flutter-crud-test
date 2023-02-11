import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../shared_library/views/max_body_widget.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: MaxWidthWidget(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: Get.width - 100,
                  child: SvgPicture.asset(
                    'lib/recourses/assets/images/404.svg',
                    fit: BoxFit.contain,
                    allowDrawingOutsideViewBox: true,
                    cacheColorFilter: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
