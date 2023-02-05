import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mc_crud_test/presentation/routing/routing.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>context.push(Routing.addCustomerPage),
        child: SvgPicture.asset(
          Icony.addPerson,
          color: Colors.white,
        ),
      ),
    );
  }
}
