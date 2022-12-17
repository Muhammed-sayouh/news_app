import 'package:intl/intl.dart';



String convertTimeToDaysAndHours(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
}



