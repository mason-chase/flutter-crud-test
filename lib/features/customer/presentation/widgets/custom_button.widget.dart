import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final bool backgroundWhite;
  final Function onPressed;
  final String title;

  const CreateAccountButton({
    required Key key,
    this.backgroundWhite = true,
    required this.onPressed,
    this.title = 'Submit',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: backgroundWhite
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).backgroundColor,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.41),
          ),
        ],
      ),
    );
  }
}
