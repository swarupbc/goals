import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppControllers {
  static DateFormat dateFormat = DateFormat.yMMMMd();
  static DateFormat formattedDateMM = DateFormat("MMM dd, yyyy");

  static String getDateText(DateTime date) {
    String _dateText = formattedDateMM.format(date);
    if (date.year == DateTime.now().year) {
      _dateText = _dateText.replaceAll(", ${date.year.toString()}", '');
    }

    return _dateText;
  }

  static String getTimeText(TimeOfDay time) {
    String timeText = ' ';
    DateTime date = DateTime.now();
    final dt =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    final _format = DateFormat.jm();
    timeText = _format.format(dt);
    return timeText;
  }
}
