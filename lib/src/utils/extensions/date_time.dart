const _daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

extension ShadDateTime on DateTime {
  bool isLeapYear(int value) =>
      value % 400 == 0 || (value % 4 == 0 && value % 100 != 0);

  int get daysInMonth {
    var result = _daysInMonth[month - 1];
    if (month == 2 && isLeapYear(year)) result++;
    return result;
  }

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isSameDayOrGreatier(DateTime other) =>
      isSameDay(other) || isAfter(other);

  bool isSameDayOrLower(DateTime other) => isSameDay(other) || isBefore(other);

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  DateTime get startOfWeek {
    return DateTime(year, month, day - day % 7);
  }

  DateTime get endOfWeek {
    return DateTime(year, month, day - day % 7 + 6);
  }

  DateTime get startOfMonth {
    return DateTime(year, month);
  }

  DateTime get endOfMonth {
    return DateTime(year, month, daysInMonth);
  }

  DateTime get previousDay {
    if (day == 1) {
      final previousMonth = DateTime(
        year,
        month - 1,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
      return DateTime(
        previousMonth.year,
        previousMonth.month,
        previousMonth.daysInMonth,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
    }
    return DateTime(
      year,
      month,
      day - 1,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  DateTime get nextDay {
    if (day == daysInMonth) {
      final nextMonth = DateTime(year, month + 1);
      return DateTime(
        nextMonth.year,
        nextMonth.month,
        1,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
    }
    return DateTime(
      year,
      month,
      day + 1,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Add days to the current date without taking into account the different
  /// daylight
  DateTime addDays(int days) {
    // Create a new DateTime by directly adding days and let Dart handle month/year overflow
    final newDate = DateTime(year, month, day + days);

    // Ensure the result has a time of 00:00:00 (midnight)
    return DateTime(newDate.year, newDate.month, newDate.day);
  }

  /// Remove days from the current date without taking into account the
  /// different daylight
  DateTime removeDays(int days) {
    // Create a new DateTime by directly subtracting days and let Dart handle month/year underflow
    final newDate = DateTime(year, month, day - days);

    // Ensure the result has a time of 00:00:00 (midnight)
    return DateTime(newDate.year, newDate.month, newDate.day);
  }

  DateTime get previousMonth {
    if (month == 1) {
      return DateTime(
        year - 1,
        12,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
    }
    return DateTime(
      year,
      month - 1,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  DateTime get nextMonth {
    if (month == 12) {
      return DateTime(
        year + 1,
        1,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );
    }
    return DateTime(
      year,
      month + 1,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }
}
