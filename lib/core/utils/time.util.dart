class TimeUtil {
  static String convertDateTimeToString(DateTime dateTime) =>
      '${dateTime.year}-${dateTime.month}-${dateTime.day}';

  static DateTime convertStringToDateTime(String dateTime) {
    final sepratedDate = dateTime.split("-");
    if (sepratedDate.length != 3) throw Error();
    final year = int.parse(sepratedDate[0]);
    final month = int.parse(sepratedDate[1]);
    final day = int.parse(sepratedDate[2]);
    return DateTime(year, month, day);
  }

  // day from datetime
  static String getDayFromDateTime(DateTime dateTime) {
    return dateTime.day.toString();
  }
}
