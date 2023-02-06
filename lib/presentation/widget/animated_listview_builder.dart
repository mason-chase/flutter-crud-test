import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/presentation/core/type_def.dart';

enum ListItemAnimationDirection { vertical, horizontal }

class AnimatedListViewBuilder extends StatelessWidget {
  final int itemCount;
  final ListItemBuilder itemBuilder;
  final EdgeInsets? padding;
  final ScrollController? controller;
  final ListItemAnimationDirection animationDirection;

  const AnimatedListViewBuilder({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding,
    this.controller,
    this.animationDirection = ListItemAnimationDirection.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        padding: padding ?? EdgeInsets.zero,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 400),
            child: SlideAnimation(
              verticalOffset:
                  animationDirection == ListItemAnimationDirection.vertical ? 75.0.h : null,
              horizontalOffset:
                  animationDirection == ListItemAnimationDirection.horizontal ? 75.0.w : null,
              child: FadeInAnimation(
                child: itemBuilder(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
