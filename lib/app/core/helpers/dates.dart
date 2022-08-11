import 'package:intl/intl.dart';

class DatesHelper {
  static String getDateWithDayOfWeek(DateTime date) {
    return DateFormat('EEE dd/MM', 'pt_Br').format(date);
  }

  static String getDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String getTime(DateTime date) {
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  static String getDateTime(DateTime date) {
    return "${getDate(date)} ${getTime(date)}";
  }

  static String formattedDate(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    final dateFormat = DateFormat('EEE dd/MM/yyyy', 'pt_Br');

    final dateBack = date;
    final dateParse = DateTime.parse(dateBack);

    return dateFormat.format(dateParse);
  }

  static DateTime convertDate(String date) {
    var dateFormatted = DateFormat('dd/MM/yyyy');
    return dateFormatted.parse(date);
  }

  static String dateNoTime(String data) {
    if (data.toString().split('-').isNotEmpty) {
      return data.toString();
    }
    var retorno = DatesHelper.convertDate(data).toString().split(' ');
    return retorno[0];
  }

  static String formatDateTime(String date, {bool dateOnly = false}) {
    DateTime data = DateTime.parse(date);
    var outputFormat = (dateOnly == true)
        ? DateFormat('dd/MM/yyyy')
        : DateFormat('dd/MM/yyyy HH:mm:ss');
    return outputFormat.format(data);
  }

  static String formatDate(String? date) {
    if (date == null || date == '') {
      return '';
    }
    final dateFormat = DateFormat('dd/MM/yyyy', 'pt_Br');

    final dateBack = date;
    final dateParse = DateTime.parse(dateBack);

    return dateFormat.format(dateParse);
  }

  static String formattedDayAndMonth(String date) {
    final dateFormat = DateFormat('EEE dd/MM', 'pt_Br');

    final dateParse = DateTime.parse(date);

    return dateFormat.format(dateParse);
  }

  static String formatDateToApi(String? date) {
    if (date == null || date == '') {
      return '';
    }

    final dateArr = date.split('/');

    return '${dateArr[2]}-${dateArr[1]}-${dateArr[0]}';
  }
}
