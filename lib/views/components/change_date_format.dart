import 'package:intl/intl.dart';

String changeDateFormat(String dateString){
  DateTime date = DateTime.parse(dateString);
  String formatDate;
  if (date.day == DateTime.now().day) {
    formatDate = DateFormat.jm().format(date);
  } else if (date.year == DateTime.now().year) {
    formatDate = DateFormat.MMMMd().format(date);
  } else {
    formatDate = DateFormat.yMMMd().format(date);
  }
  return formatDate;
}