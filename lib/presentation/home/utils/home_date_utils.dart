class HomeDateUtils {
  static DateTime dateOnly(DateTime date) => DateTime(date.year, date.month, date.day);

  static DateTime startOfWeek(DateTime date) {
    final normalized = dateOnly(date);
    final daysFromSunday = normalized.weekday % 7;
    return normalized.subtract(Duration(days: daysFromSunday));
  }

  static List<DateTime> weekDates(DateTime selectedDate) {
    final start = startOfWeek(selectedDate);
    return List.generate(7, (index) => start.add(Duration(days: index)));
  }

  static bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String weekdayLabel(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}