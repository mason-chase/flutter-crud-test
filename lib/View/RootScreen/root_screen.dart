import 'package:amir_crud_test/Model/GetX/Controller/duplicate_controller.dart';
import 'package:amir_crud_test/Model/Widgets/widget.dart';
import 'package:amir_crud_test/View/HomeScreen/home_screen.dart';
import 'package:amir_crud_test/View/DetailScreen/detail_screen.dart';
import 'package:amir_crud_test/ViewModel/Repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createCustomer(textTheme: textTheme, repository: repository);
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
