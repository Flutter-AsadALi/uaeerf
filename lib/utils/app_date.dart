// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

///
///
///

///
///
///
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  ///
  ///
  ///
  bool isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs | date.isAfter(dateTime);
  }

  bool isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs | date.isBefore(dateTime);
  }

  ///
  ///
  ///
  bool isBetween(
      DateTime fromDateTime,
      DateTime toDateTime,
      ) {
    final date = this;

    final isAfter = date.isAfterOrEqualTo(fromDateTime);
    final isBefore = date.isBeforeOrEqualTo(toDateTime);
    return isAfter && isBefore;
  }
}

double isAdult(DateTime dob) {
  var today = DateTime.now();
  final difference = today.difference(dob).inDays;
  final year = difference / 365;
  return year;
}

///
///
///
///
final monthNameDateYearFormat = DateFormat.yMMMd();
final timeWithoutAMPMFormat = DateFormat.Hm();
final timeWithAMPMFormat = DateFormat.jm();

final monthDateYearFormat = DateFormat.yMd();
final dayNameMonthNameDateYearFormat = DateFormat.yMMMMEEEEd();
final monthNameDayDateYearFormat = DateFormat.yMMMMd();
final weekDayNameFormat = DateFormat('EEEE');
final monthNameFormat = DateFormat.MMM();
final monthDateFormat = DateFormat('dd');
final dayNameMonthYear = DateFormat('EEEE MM/yy');
final dateMonthYearFormat = DateFormat('dd-MM-yyyy');
final yearMonthDayFormat = DateFormat('yyyy-MM-dd');
final ymdhmsFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
