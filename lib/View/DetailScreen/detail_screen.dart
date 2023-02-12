import 'package:amir_crud_test/Model/Description/description.dart';
import 'package:amir_crud_test/Model/GetX/Controller/duplicate_controller.dart';
import 'package:amir_crud_test/Model/Widgets/widget.dart';
import 'package:amir_crud_test/View/DetailScreen/cubit/detail_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final String lottieUrl =
      "https://assets8.lottiefiles.com/private_files/lf30_cgfdhxgx.json";

  @override
  Widget build(BuildContext context) {
    final duplicateController = Get.find<DuplicateController>();
    final textTheme = Get.textTheme;
    final repository = duplicateController.repository;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("assets/Background/bg1.jpg"),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: BlocBuilder<DetailCubit, DetailState>(
            builder: (context, state) {
              if (state is DetailLoding) {
                return const CustomLoading(widgetSize: 60, color: Colors.amber);
              } else if (state is DetailEmpty) {
                return CustomEmptyScreen(lottieUrl: lottieUrl);
              } else if (state is DetailSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Customer Detail",
                          style: textTheme.titleLarge!
                              .copyWith(color: Colors.amber),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          child: ListView.builder(
                            itemCount: state.customerList.length,
                            itemBuilder: (context, index) {
                              final customer = state.customerList[index];
                              return InkWell(
                                onTap: () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: Text(
                                          "Edit Customer",
                                          style: textTheme.titleLarge,
                                        ),
                                        content: Text(
                                          "ُSelect you're edit type",
                                          style: textTheme.bodyMedium,
                                        ),
                                        actions: [
                                          CupertinoButton(
                                            child: Text(
                                              "Update",
                                              style: textTheme.bodyMedium,
                                            ),
                                            onPressed: () {
                                              Get.back();
                                              createCustomer(
                                                  textTheme: textTheme,
                                                  repository: repository,
                                                  update: true,
                                                  index: index);
                                            },
                                          ),
                                          CupertinoButton(
                                            child: Text(
                                              "Delete",
                                              style: textTheme.bodyMedium,
                                            ),
                                            onPressed: () async {
                                              Get.back();
                                              final Description description =
                                                  await repository
                                                      .deleteCustomer(
                                                          index: index);
                                              if (description.isValid) {
                                                // ignore: use_build_context_synchronously
                                                Get.context!
                                                    .read<DetailCubit>()
                                                    .detailStart();
                                                Get.snackbar("Delete",
                                                    description.description,
                                                    backgroundColor:
                                                        Colors.grey);
                                              } else {
                                                Get.snackbar("Delete",
                                                    description.description,
                                                    backgroundColor:
                                                        Colors.grey);
                                              }
                                            },
                                          ),
                                          CupertinoButton(
                                            child: Text(
                                              "Cancel",
                                              style: textTheme.bodyMedium,
                                            ),
                                            onPressed: () async {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.all(12),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      customerItem(
                                        prefix: Text(
                                          "${customer.firstName} ${customer.lastName}",
                                          style: textTheme.bodyMedium,
                                        ),
                                        suffix: Text(
                                          customer.phoneNumber,
                                          style: textTheme.bodyMedium,
                                        ),
                                      ),
                                      customerItem(
                                        prefix: Text(
                                          customer.email,
                                          style: textTheme.bodyMedium,
                                        ),
                                        suffix: Text(
                                          customer.bankAccountNumber,
                                        ),
                                      ),
                                      customerItem(
                                          prefix: const Icon(Icons.date_range),
                                          suffix: Text(
                                            customer.dateOfBirth.toString(),
                                            style: textTheme.bodySmall,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget customerItem({required Widget prefix, required Widget suffix}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: Get.width * 0.4, child: prefix),
          SizedBox(width: Get.width * 0.4, child: suffix)
        ],
      ),
    );
  }
}
