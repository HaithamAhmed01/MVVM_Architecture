import 'package:intl/intl.dart';

class GetDateFormats {
  String? getFilterDate(String? date) {
    String? filteredDate;
    try {
      DateFormat myFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      DateTime dateParsed = myFormat.parse(date!, true);
      filteredDate = DateFormat.yMMMd("en_US").format(dateParsed);
      return filteredDate;
    } catch (e) {
      return '';
    }
  }

  String? getyyyyMMMMddDate(String? date) {
    var arabic = RegExp(r'^[\u0621-\u064A]+');
    final isArabic = arabic.hasMatch(date ?? "");
    String? filteredDate;
    try {
      DateFormat myFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      DateTime dateParsed = myFormat.parse(date!, true);
      if (isArabic) {
        filteredDate = DateFormat("yyyy MMMM dd").format(dateParsed);
      }
      filteredDate = DateFormat("dd MMMM yyyy").format(dateParsed);
      return filteredDate;
    } catch (e) {
      return '';
    }
  }

  String? getFilterDateTimeFormat(DateTime? dateParsed) {
    String? filteredDate;
    try {
      filteredDate = DateFormat.yMMMd("en_US").format(dateParsed!);
      return filteredDate;
    } catch (e) {
      return '';
    }
  }

  String? getMonthOnly(DateTime? dateParsed) {
    String? filteredDate;
    try {
      filteredDate = DateFormat.yMMM("en_US").format(dateParsed!);
      return filteredDate;
    } catch (e) {
      return '';
    }
  }

  String? getFilterTime(String? date) {
    String? filteredDate;
    try {
      DateFormat myFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      DateTime dateParsed = myFormat.parse(date!, true);
      filteredDate = DateFormat.Hms("en_US").format(dateParsed);
      return filteredDate;
    } catch (e) {
      return '';
    }
  }

  String? getYMEDtoYYYYMMDD(String? date) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
    DateTime dateTime = dateFormat.parse(date!);
    DateFormat myFormat = DateFormat("yyyy-MM-dd");
    String dateParsed = myFormat.format(dateTime);
    return dateParsed;
  }

  DateTime? getMonthDay(String? date) {
    //String? filteredDate;
    try {
      DateFormat myFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      DateTime dateParsed = myFormat.parse(date!);
      return dateParsed;
    } catch (e) {
      return null;
    }
  }

  String? getMonthFormatDay(DateTime? date) {
    //String? filteredDate;
    try {
      DateFormat myFormat = DateFormat("MM/dd/yyyy");
      String dateParsed = myFormat.format(date!);
      return dateParsed;
    } catch (e) {
      return null;
    }
  }

  String? getFormatDate(DateTime? date) {
    try {
      DateFormat myFormat = DateFormat("yyyy-MM-dd");
      String dateParsed = myFormat.format(date!);
      return dateParsed;
    } catch (e) {
      return null;
    }
  }

  String? getSpecialFormatDate(DateTime? date) {
    try {
      DateFormat myFormat = DateFormat.yMMMEd();
      String dateParsed = myFormat.format(date!);
      return dateParsed;
    } catch (e) {
      return null;
    }
  }

  int? formatCalculateTime(String start, String end) {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd kk:mm");

      DateTime startParsed = dateFormat.parse(start);
      DateTime endParsed = dateFormat.parse(end);
      int minutes = endParsed.difference(startParsed).inMinutes;

      // PrintLogs.printLogs(minutes);
      return minutes;
    } catch (e) {
      return 0;
    }
  }

  bool? dateIsAfter(String start, String end) {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd kk:mm");

      DateTime startParsed = dateFormat.parse(start);
      DateTime endParsed = dateFormat.parse(end);

      if (endParsed.isBefore(startParsed)) {
        // PrintLogs.printLogs('befiree');
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  int? calculateDate(String startDate, String endDate) {
    try {
      DateFormat dateFormat = DateFormat("kk:mm");
      //DateFormat myLastFormat = DateFormat("kk:mm");
      DateTime startParsed = dateFormat.parse(startDate);
      int minutes = 0;
      if (endDate.isNotEmpty) {
        DateTime endParsed = dateFormat.parse(endDate);
        minutes = endParsed.difference(startParsed).inMinutes;
      }
      // PrintLogs.printLogs('ayaaa');
      if (minutes == 0) {
        // PrintLogs.printLogs('vichhh ayaaa');
        String endIs = dateFormat.format(DateTime.now());
        DateTime endParsed = dateFormat.parse(endIs);
        minutes = endParsed.difference(startParsed).inMinutes;
        return minutes;
      } else {
        return minutes;
      }
    } catch (e) {
      return 0;
    }
  }

  int? calculateFormDate(String startDate, String endDate) {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
      //DateFormat myLastFormat = DateFormat("kk:mm");
      DateTime startParsed = dateFormat.parse(startDate);
      int days = 0;
      DateTime endParsed = dateFormat.parse(endDate);
      days = endParsed.difference(startParsed).inDays;

      return days;
    } catch (e) {
      // PrintLogs.printLogs('carr ${e.toString()}');
      return 0;
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  int daysTotalDaysBetween(String startDate, String endDate) {
    int count = 0;
    DateTime startParsed = DateTime.parse(startDate);
    DateTime endParsed = DateTime.parse(endDate);
    DateTime from =
        DateTime(startParsed.year, startParsed.month, startParsed.day);
    DateTime to = DateTime(endParsed.year, endParsed.month, endParsed.day);
    for (int i = 0; i <= (to.difference(from).inHours / 24).round(); i++) {
      count++;
    }
    return count;
  }

  String? formatIntoYYYYMMDDDate(String date) {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
      DateFormat confirmedDateFormat = DateFormat("yyyy-MM-dd");
      //DateFormat myLastFormat = DateFormat("kk:mm");
      DateTime startParsed = dateFormat.parse(date);
      String endParsed = confirmedDateFormat.format(startParsed);

      return endParsed;
    } catch (e) {
      return '';
    }
  }

  String? formatInto24HourTime(String time) {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss");
      DateFormat confirmedDateFormat = DateFormat("kk:mm");
      //DateFormat myLastFormat = DateFormat("kk:mm");
      DateTime startParsed = dateFormat.parse(time);
      String endParsed = confirmedDateFormat.format(startParsed);

      return endParsed;
    } catch (e) {
      return '';
    }
  }

  String? calculateDaysAgo(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
    DateTime notificationParsed = dateFormat.parse(date);
    var totalDays = DateTime.now().difference(notificationParsed).inDays;
    // PrintLogs.printLogs('ttttt $totalDays');
    if (totalDays > 0) {
      if (totalDays < 3) {
        return '$totalDays day ago';
      } else {
        return '$totalDays days ago';
      }
    } else {
      var totalHours = DateTime.now().difference(notificationParsed).inHours;
      if (totalHours > 0) {
        return '$totalHours hours ago';
      } else {
        var totalMinutes =
            DateTime.now().difference(notificationParsed).inMinutes;
        return '$totalMinutes minutes ago';
      }
    }
  }

  bool? calculateTokenExpiry(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
    DateTime notificationParsed = dateFormat.parse(date);
    var totalMinutesLeft =
        notificationParsed.difference(DateTime.now()).inMinutes;
    // PrintLogs.printLogs('total miutess ${totalMinutesLeft}');
    if (totalMinutesLeft > 1) {
      return true;
    } else {
      return false;
    }
  }

  String getDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    // String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)} : $twoDigitMinutes";
  }

  getMonthNameOnly(DateTime selectedDate) {
    String? filteredDate;
    try {
      filteredDate = DateFormat.MMM("en_US").format(selectedDate);
      return filteredDate;
    } catch (e) {
      return '';
    }
  }

  getDateFormatMMDDYYYY(String? date) {
    DateFormat dateFormat = DateFormat("MM/dd/yyyy");
    DateTime dateTime = dateFormat.parse(date ?? '7/19/2022');
    return dateTime;
  }

  getTimeInFormat(int? hour, String? minute) {
    DateFormat dateFormat = DateFormat("HH:mm");
    DateTime dateTime = dateFormat.parse('${hour ?? 01}:${minute ?? 00}');
    return DateFormat("hh:mm a").format(dateTime);
  }

  String? getSubmissionDate(DateTime? dateTime) {
    //2022-06-18T01:06:08.507Z
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String time = dateFormat.format(dateTime ?? DateTime.now());
    return time;
  }

  String? getSubmissionDate2(DateTime? dateTime) {
    //2022-06-18T01:06:08.507Z
    DateFormat dateFormat = DateFormat("MM/dd/yyyy");
    String time = dateFormat.format(dateTime ?? DateTime.now());
    return time;
  }

  getDateOnly(String? bookedDate) {
    try {
      //print('${spl?[0]}');
      DateFormat dateFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return DateFormat.yMMMEd().format(dateTime);
    } catch (e) {
      return e.toString();
    }
  }

  getDateInYYYYMMDD(String? bookedDate) {
    try {
      //print('${spl?[0]}');
      DateFormat dateFormat = DateFormat("yyyy-MM-ddThh:mm:ss");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return DateFormat("yyyy/MM/dd").format(dateTime);
    } catch (e) {
      return e.toString();
    }
  }

  getTimeOnly(String? bookedDate) {
    try {
      DateFormat dateFormat = DateFormat("hh:mm:ss");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  getMonthByDateTime(String? bookedDate) {
    try {
      DateFormat dateFormat = DateFormat("MM/dd/yyyy");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return dateTime;
    } catch (e) {
      return null;
    }
  }

  getMonthByString(String? bookedDate) {
    try {
      DateFormat dateFormat = DateFormat("MM/dd/yyyy");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return DateFormat.MMM().format(dateTime);
    } catch (e) {
      return '';
    }
  }

  getWeekNumberByString(String? bookedDate) {
    try {
      DateFormat dateFormat = DateFormat("MM/dd/yyyy");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return dateTime.day.toString().padLeft(2, '0');
    } catch (e) {
      return '';
    }
  }

  getWeekNameByString(String? bookedDate) {
    try {
      DateFormat dateFormat = DateFormat("MM/dd/yyyy");
      DateTime dateTime = dateFormat.parse(bookedDate ?? '');
      return DateFormat.E().format(dateTime);
    } catch (e) {
      return '';
    }
  }

  String? getTimeByDayTypeTime(String? date) {
    if (date != null) {
      DateFormat dateFormat = DateFormat("yyyy-MM-ddTKK:mm");
      DateTime dateTime = dateFormat.parse(date);
      var today = DateTime.now();
      if (dateTime.day == today.day) {
        if (dateTime.minute == today.minute) {
          return 'Today, now';
        } else if (dateTime.hour == (today.hour)) {
          return 'Today, ${today.minute - dateTime.minute} ${(today.minute - dateTime.minute) == 1 ? "minute" : "minutes"} ago';
        } else {
          return 'Today, ${DateFormat("kk:mm").format(dateTime)}';
        }
      }
      if (dateTime.isBefore(today) && (today.day - dateTime.day) == 1) {
        return 'Yesterday, ${DateFormat("kk:mm").format(dateTime)}';
      } else {
        return 'On ${DateFormat.yMMMEd("en_US").format(dateTime)}';
      }
    } else {
      return null;
    }
  }
}
