class AppUtils {

  splitDate(String date) =>
     date.split('-');

  bool isEmailValid(String email) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

   bool isMobilePhoneNumberValid(String phoneNumber) =>
      RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
          .hasMatch(phoneNumber);


}