import 'package:flutter/material.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';

class QuarterCircle extends StatelessWidget {
  const QuarterCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -150,
      bottom: -150,
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colory.neutralColor.shade200),
      ),
    );
  }
}
