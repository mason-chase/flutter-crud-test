import 'package:amir_crud_test/ViewModel/DataSource/datasouce.dart';
import 'package:amir_crud_test/ViewModel/Functions/functions.dart';
import 'package:amir_crud_test/ViewModel/Repository/repository.dart';
import 'package:get/get.dart';


class DuplicateController extends GetxController {
  final Repository repositoryInstance =
      Repository(RemoteDataSource(Functions()));
  Repository get repository => repositoryInstance;
  @override
  void onInit() async {
    await repository.initDatabase();
    super.onInit();
  }
}
