import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox('customerBox');

  CustomerDTO customer = CustomerDTO.fromJson({
    "firstName": "testFirstName2",
    "lastName": "testLastName2",
    "dateOfBirth": "010102",
    "phoneNumber": "1234567891",
    "email": "test2@email.com",
    "bankAcountNumber": "1234567891"
  });

  late final Box box;
  box = Hive.box('customerBox');

  await box.add(customer.toJson() ?? {});

  log("box map = ${box.toMap()}");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(""),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
