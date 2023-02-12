class Failure {
  final String exception;

  Failure({
    required this.exception,
  });

  factory Failure.somethingWentWrong() => Failure(
        exception: 'Something went wrong',
      );
}
