import 'package:equatable/equatable.dart';

///
/// This class use for handle errors.
/// It contains a string to explain error.
/// 
class Failure extends Equatable {
  final String errorReason;
  const Failure(this.errorReason);

  @override
  List<Object?> get props => [errorReason];

  @override
  bool? get stringify => true;
}
