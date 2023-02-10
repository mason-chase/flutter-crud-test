import 'package:amir_crud_test/Model/DataBase/hive_database.dart';
import 'package:amir_crud_test/Model/Description/description.dart';
import 'package:amir_crud_test/Model/GetX/Controller/duplicate_controller.dart';
import 'package:amir_crud_test/Model/Widgets/widget.dart';
import 'package:amir_crud_test/View/DetailScreen/cubit/detail_cubit.dart';
import 'package:amir_crud_test/View/HomeScreen/home_screen.dart';
import 'package:amir_crud_test/View/DetailScreen/detail_screen.dart';
import 'package:amir_crud_test/ViewModel/Repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final duplicateController = Get.find<DuplicateController>();
  late Repository repository = duplicateController.repository;
  final PageController pageController = PageController();
  final textTheme = Get.textTheme;
  @override
  void dispose() async {
    await repository.closeDatabase();
    duplicateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController surnamecontroller = TextEditingController();
    final TextEditingController numbercontroller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController bankNumbercontroller = TextEditingController();
    final GlobalKey<FormState> nameKey = GlobalKey();
    final GlobalKey<FormState> surnameKey = GlobalKey();
    final GlobalKey<FormState> numberKey = GlobalKey();
    final GlobalKey<FormState> emailKey = GlobalKey();
    final GlobalKey<FormState> bankNumberKey = GlobalKey();
    DateTime? dateTime;
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            context: Get.context!,
            builder: (context) {
              const edgeInsets = EdgeInsets.all(12);
              return Container(
                height: Get.size.height * 0.8,
                padding: const EdgeInsets.fromLTRB(15, 4, 15, 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: SizedBox(
                      width: Get.size.width * 0.5,
                      child: FloatingActionButton.extended(
                          onPressed: () async {
                            final bool validateKeys =
                                nameKey.currentState!.validate() &&
                                    surnameKey.currentState!.validate() &&
                                    numberKey.currentState!.validate() &&
                                    emailKey.currentState!.validate() &&
                                    bankNumberKey.currentState!.validate();

                            if (validateKeys) {
                              if (dateTime == null) {
                                Get.snackbar("Date Of Birtch",
                                    "Please select your date of birtch",
                                    backgroundColor: Colors.white70);
                              } else {
                                final Description description =
                                    await repository.addToDatabase(
                                        database: Database(
                                            namecontroller.text,
                                            surnamecontroller.text,
                                            dateTime!,
                                            numbercontroller.text,
                                            emailcontroller.text,
                                            bankNumbercontroller.text));
                                if (description.isValid) {
                                  // ignore: use_build_context_synchronously
                                  Get.context!
                                      .read<DetailCubit>()
                                      .detailStart();
                                  Get.back();
                                }
                                Get.snackbar(
                                    "Customer Detail", description.description,
                                    backgroundColor: Colors.white70);
                              }
                            }
                          },
                          label: Text(
                            "Save",
                            style: textTheme.bodyMedium!
                                .copyWith(color: Colors.white),
                          ))),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Column(
                      children: [
                        CupertinoButton(
                          child: Container(
                            width: 40,
                            height: 7,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          height: Get.size.height * 0.6,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                textField(
                                    inputType: TextInputType.streetAddress,
                                    textTheme: textTheme,
                                    controller: namecontroller,
                                    formKey: nameKey,
                                    lable: "First Name",
                                    edgeInsetsGeometry: edgeInsets,
                                    characters: 2),
                                textField(
                                    inputType: TextInputType.streetAddress,
                                    textTheme: textTheme,
                                    controller: surnamecontroller,
                                    formKey: surnameKey,
                                    lable: "Last Name",
                                    edgeInsetsGeometry: edgeInsets,
                                    characters: 2),
                                textField(
                                    inputType: TextInputType.phone,
                                    textInputFormatter:
                                        FilteringTextInputFormatter.digitsOnly,
                                    textTheme: textTheme,
                                    controller: numbercontroller,
                                    formKey: numberKey,
                                    lable: "Phone Number",
                                    edgeInsetsGeometry: edgeInsets,
                                    characters: 10),
                                textField(
                                    inputType: TextInputType.streetAddress,
                                    textTheme: textTheme,
                                    controller: emailcontroller,
                                    formKey: emailKey,
                                    lable: "Email Address",
                                    edgeInsetsGeometry: edgeInsets,
                                    characters: 8),
                                Padding(
                                  padding: edgeInsets,
                                  child: Theme(
                                    data: ThemeData(
                                        colorScheme: const ColorScheme.light(
                                            primary: Colors.grey,
                                            onSurface: Colors.grey)),
                                    child: Form(
                                      key: bankNumberKey,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          bankNumberKey.currentState!
                                              .validate();
                                        },
                                        validator: (value) {
                                          if (value!.isNotEmpty) {
                                            return null;
                                          } else {
                                            return "this item required";
                                          }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(19),
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: bankNumbercontroller,
                                        cursorColor: Colors.grey,
                                        focusNode: FocusNode(),
                                        decoration: InputDecoration(
                                          labelText: "Bank Account Number",
                                          labelStyle: textTheme.bodyMedium,
                                          floatingLabelStyle:
                                              textTheme.bodySmall!.copyWith(
                                                  fontWeight: FontWeight.w700),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: edgeInsets,
                                  child: OutlinedButton(
                                    child: Text("Select Date Of Birtch",
                                        style: textTheme.bodyMedium),
                                    onPressed: () async {
                                      final now = DateTime.now();
                                      final lastDate = DateTime(
                                        now.year - 18,
                                        now.month,
                                        now.day,
                                      );

                                      dateTime = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime(1900),
                                          firstDate: DateTime(1900),
                                          lastDate: lastDate);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  child: const Icon(CupertinoIcons.home),
                  onPressed: () {
                    pageController.jumpToPage(0);
                  },
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.creditcard),
                  onPressed: () {
                    pageController.jumpToPage(1);
                  },
                ),
              ],
            )),
      ),
      body: PageView(
          controller: pageController,
          children: const [HomeScreen(), DetailScreen()]),
    );
  }
}
