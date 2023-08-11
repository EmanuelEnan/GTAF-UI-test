import 'package:intl/intl.dart';

class ShowingTime {
  static String extractClockTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inDays >= 7) {
      // The time is more than 6 days ago, so return the date in the desired format
      return FormatDate.formatDate(dateTime);
    } else if (difference.inDays >= 2) {
      // The time is between 2 and 6 days ago, so return the day name
      return GetDayName.getDayName(dateTime);
    } else if (difference.inDays >= 1) {
      // The time is within the last 48 hours, so return 'yesterday'
      return 'yesterday';
    } else {
      // The time is within the last 24 hours, so return the clock time
      return FormatClockTime.formatClockTime(dateTime);
    }
  }
}

class FormatDate {
  static String formatDate(DateTime dateTime) {
    return DateFormat('MM/dd/yy').format(dateTime);
  }
}

class GetDayName {
  static String getDayName(DateTime dateTime) {
    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return weekdays[dateTime.weekday - 1];
  }
}

class FormatClockTime {
  static String formatClockTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}';
  }
}
