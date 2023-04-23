extension Validation on String? {
  bool get isNotNull =>
      this != null && this!.trim().isNotEmpty;

  bool get isEmail =>
      isNotNull &&
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this!);

  bool get isPhone =>
      isNotNull && RegExp(r"""^(?:[+0][1-9])?[0-9]{10,12}$""").hasMatch(this!);

  bool get isName =>
      isNotNull &&
      RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$").hasMatch(this!);

  bool get isNumber => isNotNull && RegExp(r"^[0-9]+$").hasMatch(this!);

  bool get isAlphabet => isNotNull && RegExp(r"^[a-zA-Z]+$").hasMatch(this!);

  bool get isAlphanumeric =>
      isNotNull && RegExp(r"^[a-zA-Z0-9]+$").hasMatch(this!);

  bool get isBankAccount =>
      isNotNull &&
      RegExp(r"^([0-9]{11})|([0-9]{2}-[0-9]{3}-[0-9]{6})$").hasMatch(this!);

  // date validator with this format yyyy-mm-dd or this format yyyy-m-d and this format yyyy-m-dd and this format yyyy-mm-d
  bool get isDate => isNotNull && RegExp(r"^\d{4}-\d{1,2}-\d{1,2}$").hasMatch(this!);



}

extension ValidationMessage on String? {
  String? emailValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Email is required';
    if (!isEmail) return 'Invalid email';
    return null;
  }

  String? phoneValidationMessage() {
    if (this == null || this!.isEmpty) return 'Phone is required';
    if (!isPhone) return 'Invalid phone';
    return null;
  }

  String? nameValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Name is required';
    if (!isName) return 'Invalid name';
    return null;
  }

  String? numberValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Number is required';
    if (!isNumber) return 'Invalid number';
    return null;
  }

  String? alphabetValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Alphabet is required';
    if (!isAlphabet) return 'Invalid alphabet';
    return null;
  }

  String? alphanumericValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Alphanumeric is required';
    if (!isAlphanumeric) return 'Invalid alphanumeric';
    return null;
  }

  String? bankAccountValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Bank account is required';
    if (!isBankAccount) return 'Invalid bank account';
    return null;
  }

  String? dateValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Date is required';
    if (!isDate) return 'Invalid date';
    return null;
  }

  String? requiredValidationMessage() {
    if (this == null|| this!.isEmpty) return 'Required';
    return null;
  }
}
