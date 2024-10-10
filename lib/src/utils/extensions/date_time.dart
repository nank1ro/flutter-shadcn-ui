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

  /// The ISO 8601 week number [1..53].
  ///
  /// Algorithm from https://en.wikipedia.org/wiki/ISO_week_date#Algorithms
  int get weekNumber {
    // Add 10 to always compare with January 4th, which is always in week 1
    // Add 7 to index weeks starting with 1 instead of 0
    final woy = (ordinalDate - weekday + 10) ~/ 7;

    // If the week number equals zero, it means that the given date belongs to
    // the preceding (week-based) year.
    if (woy == 0) {
      // The 28th of December is always in the last week of the year
      return DateTime(year - 1, 12, 28).weekNumber;
    }

    // If the week number equals 53, one must check that the date is not
    // actually in week 1 of the following year
    if (woy == 53 &&
        DateTime(year).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }

    return woy;
  }

  /// The ordinal date, the number of days since December 31st the previous
  /// year.
  ///
  /// January 1st has the ordinal date 1
  ///
  /// December 31st has the ordinal date 365, or 366 in leap years
  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear(year) && month > 2 ? 1 : 0);
  }
}
