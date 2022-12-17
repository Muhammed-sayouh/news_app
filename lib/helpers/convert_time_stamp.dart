import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart'as timeago;

String convertTimeToDaysAndHours(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
}

String convertTimeToDays(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

String convertTimeToTimeAgo(DateTime dateTime){
return timeago.format(dateTime);
}