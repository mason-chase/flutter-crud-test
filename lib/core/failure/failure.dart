import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final List<dynamic>? errorReason;
  const Failure(this.errorReason);

  @override
  List<Object?> get props => [errorReason];

  @override
  bool? get stringify => true;
}
