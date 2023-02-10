import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

Widget textField(
    {required TextTheme textTheme,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey,
    required String lable,
    required EdgeInsetsGeometry edgeInsetsGeometry,
    required int characters,
    TextInputType inputType = TextInputType.emailAddress,
    bool obscureText = false,
    TextInputFormatter? textInputFormatter}) {
  return Padding(
      padding: edgeInsetsGeometry,
      child: Theme(
        data: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: Colors.grey, onSurface: Colors.grey)),
        child: Form(
          key: formKey,
          child: TextFormField(
              inputFormatters:
                  textInputFormatter != null ? [textInputFormatter] : null,
              obscureText: obscureText,
              keyboardType: inputType,
              onChanged: (value) {
                formKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "this item required";
                } else if (value.length < characters) {
                  return "item less than $characters characters ";
                } else {
                  return null;
                }
              },
              controller: controller,
              cursorColor: Colors.grey,
              focusNode: FocusNode(),
              decoration: InputDecoration(
                  labelText: lable,
                  labelStyle: textTheme.bodyMedium,
                  floatingLabelStyle: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w700),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)))),
        ),
      ));
}

class CustomLoading extends StatelessWidget {
  const CustomLoading(
      {super.key, required this.widgetSize, required this.color});
  final double widgetSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(color: color, size: widgetSize),
    );
  }
}

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({super.key, required this.lottieUrl});
  final String lottieUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.network(lottieUrl),
    );
  }
}
