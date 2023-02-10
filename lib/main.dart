import 'package:amir_crud_test/Model/GetX/Binding/duplicate_binding.dart';
import 'package:amir_crud_test/View/DetailScreen/cubit/detail_cubit.dart';
import 'package:amir_crud_test/View/RootScreen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DetailCubit? detailCubit;
  @override
  void dispose() {
    detailCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = DetailCubit();
            cubit.detailStart();
            detailCubit = cubit;
            return cubit;
          },
        )
      ],
      child: GetMaterialApp(
        initialBinding: DuplicateBinding(),
        title: 'Amir CURD Test',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            textTheme: TextTheme(
                bodyMedium: GoogleFonts.lato(
                    fontSize: 17, fontWeight: FontWeight.normal),
                titleLarge:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
                bodySmall: GoogleFonts.lato(fontSize: 12))),
        home: const RootScreen(),
      ),
    );
  }
}
