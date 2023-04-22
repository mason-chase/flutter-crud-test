import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/app/app_injection.config.dart';
import 'package:mc_crud_test/features/customer/presentation/home.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const HomePage();
  }
}
