import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/infrastructure/service/time_service.dart';
import 'package:mc_crud_test/presentation/widget/label.dart';

class DateSelector extends StatelessWidget {
  final String? initialDateTime;

  const DateSelector({Key? key, required this.initialDateTime}) : super(key: key);

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
                ? TimeService.convertStringToDateTime(initialDateTime!)
                : DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) => context.read<AddCustomerBloc>().add(
                  AddCustomerEvent.dateOfBirthChanged(newDateTime),
                ),
          ),
        ),
      ],
    );
  }
}
