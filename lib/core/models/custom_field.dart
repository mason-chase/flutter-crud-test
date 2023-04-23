import 'package:equatable/equatable.dart';

class CustomFiled extends Equatable {
  final String? value;
  final int maxLength;
  final String? errorMessage;
  final FieldState state;

  @override
  List<Object?> get props => [value, maxLength, errorMessage, state];

  const CustomFiled(
      {this.value = '',
      this.maxLength = 50,
      this.errorMessage,
      this.state = FieldState.initial});

  CustomFiled copyWith(
      {String? value,
      int maxLength = 50,
      errorMessage = "",
      FieldState state = FieldState.initial}) {
    return CustomFiled(
      value: value,
      maxLength: maxLength,
      state: state,
    );
  }

  static initial() {
    return CustomFiled(
        value: '', errorMessage: '', maxLength: 50, state: FieldState.initial);
  }
}

enum FieldState { initial, valid, invalid }
