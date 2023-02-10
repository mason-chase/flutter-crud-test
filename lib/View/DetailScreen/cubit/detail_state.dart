part of 'detail_cubit.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailEmpty extends DetailState {}

class DetailLoding extends DetailState {}

class DetailSuccess extends DetailState {
  final List<Database> customerList;

  DetailSuccess(this.customerList);
}
