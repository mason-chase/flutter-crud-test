import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/core/utils/time.util.dart';
import 'package:mc_crud_test/features/app/widgets/label.dart';

class DatePickerWidget extends StatelessWidget {
  final String? initialDateTime;

  const DatePickerWidget(
      {Key? key, required this.initialDateTime, required this.onDateChange})
      : super(key: key);

  // on date change function
  final Function(DateTime) onDateChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Date of birth'),
        SizedBox(
          height: 200.h,
          child: CupertinoDatePicker(
              minimumDate: DateTime(1900, 1, 1),
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDateTime != null
                  ? TimeUtil.convertStringToDateTime(initialDateTime!)
                  : DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) =>
                  {onDateChange(newDateTime)}),
        ),
      ],
    );
  }
}
