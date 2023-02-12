import 'package:flutter/material.dart';

class SelectDateWidget extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const SelectDateWidget({required this.onDateSelected, final Key? key})
      : super(key: key);

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  String title = 'select date of birth';
  DateTime initialDate = DateTime.now();

  @override
  Widget build(final BuildContext context) => OutlinedButton(
        onPressed: () async {
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1910),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            setState(() {
              initialDate = selectedDate;
              title = selectedDate.toString().split(' ').first;
            });
            widget.onDateSelected.call(selectedDate);
          }
        },
        child: Text(title),
      );
}
