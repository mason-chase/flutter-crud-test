import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/features/app/theme/app_icons.dart';

class CustomerListErrorWidget extends StatelessWidget {
  const CustomerListErrorWidget(String message, {Key? key}) : super(key: key);
  final String message = "Error";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.emptyFolder, color: Colors.black,width: 200,height: 200,),
          Text("Nothing to show :(",style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black,
          ),),
        ],
      ),
    );
  }
}
