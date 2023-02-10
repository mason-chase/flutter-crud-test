import 'package:amir_crud_test/Model/DataBase/hive_database.dart';
import 'package:amir_crud_test/Model/GetX/Controller/duplicate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());
  void detailStart() async {
    final duplicateController = Get.find<DuplicateController>();
    final repository = duplicateController.repository;
    emit(DetailLoding());
    final customerList = await repository.getCustomerList();
    if (customerList.isNotEmpty) {
      emit(DetailSuccess(customerList));
    } else {
      emit(DetailEmpty());
    }
  }
}
