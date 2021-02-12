import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

enum Time {
  nanosecond,
  microsecond,
  millisecond,
  second,
  minute,
  hour,
  day,
  week,
  month,
  calendarYear,
  decade,
  century,
  millenium,
}

/// Convert Time. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final time = convertTime(
///     Time.minute, // from
///     Time.second, // to
///     1, // value
///   );
///   print(temperature); // 60
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#time) for more information
double convertTime(Time from, Time to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Time.second) {
    switch (to) {
      case Time.nanosecond:
        return value * 1e+9;
      case Time.microsecond:
        return value * 1e+6;
      case Time.millisecond:
        return value * 1000;
      case Time.minute:
        return value / 60;
      case Time.hour:
        return value / 3600;
      case Time.day:
        return value / 86400;
      case Time.week:
        return value / 604800;
      case Time.month:
        return value / 2.628e+6;
      case Time.calendarYear:
        return value / 3.154e+7;
      case Time.decade:
        return value / 3.154e+8;
      case Time.century:
        return value / 3.154e+9;
      case Time.millenium:
        return value / 3.154e+10;
      default:
        return value;
    }
  } else {
    final second = Time.second;
    switch (from) {
      case Time.nanosecond:
        return convertTime(second, to, value / 1e+9);
      case Time.microsecond:
        return convertTime(second, to, value / 1e+6);
      case Time.millisecond:
        return convertTime(second, to, value / 1000);
      case Time.minute:
        return convertTime(second, to, value * 60);
      case Time.hour:
        return convertTime(second, to, value * 3600);
      case Time.day:
        return convertTime(second, to, value * 86400);
      case Time.week:
        return convertTime(second, to, value * 604800);
      case Time.month:
        return convertTime(second, to, value * 2.628e+6);
      case Time.calendarYear:
        return convertTime(second, to, value * 3.154e+7);
      case Time.decade:
        return convertTime(second, to, value * 3.154e+8);
      case Time.century:
        return convertTime(second, to, value * 3.154e+9);
      case Time.millenium:
        return convertTime(second, to, value * 3.154e+10);
      default:
        return value;
    }
  }
}

class TimeValues {
  final Time from;
  final num number;

  const TimeValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Time to) => convertTime(from, to, number);

  double get toNanosecond => to(Time.nanosecond);
  double get toMicroSecond => to(Time.microsecond);
  double get toMillisecond => to(Time.millisecond);
  double get toSecond => to(Time.second);
  double get toMinutes => to(Time.minute);
  double get toHours => to(Time.hour);
  double get toDays => to(Time.day);
  double get toWeeks => to(Time.week);
  double get toMonths => to(Time.month);
  double get toCalendarYear => to(Time.calendarYear);
  double get toDecades => to(Time.decade);
  double get toCentury => to(Time.century);

  Duration get asDuration {
    assert(number is int);
    var duration = Duration();
    switch (from) {
      case Time.nanosecond:
        duration = Duration(microseconds: toNanosecond.toInt());
        break;
      case Time.microsecond:
        duration = Duration(microseconds: number);
        break;
      case Time.millisecond:
        duration = Duration(milliseconds: number);
        break;
      case Time.minute:
        duration = Duration(minutes: number);
        break;
      case Time.hour:
        duration = Duration(hours: number);
        break;
      case Time.day:
        duration = Duration(days: number);
        break;
      case Time.week:
        duration = Duration(days: toWeeks.toInt());
        break;
      case Time.month:
        duration = Duration(days: toMonths.toInt());
        break;
      case Time.calendarYear:
        duration = Duration(days: toCalendarYear.toInt());
        break;
      case Time.decade:
        duration = Duration(days: toDecades.toInt());
        break;
      case Time.century:
        duration = Duration(days: toCentury.toInt());
        break;
      case Time.second:
        duration = Duration(seconds: number);
        break;
      case Time.millenium:
        duration = Duration(days: toCentury.toInt() * 10);
        break;
    }
    return duration;
  }
}

extension TimeExt on num {
  TimeValues asTime(Time time) => TimeValues(
        from: time,
        number: this,
      );
}
