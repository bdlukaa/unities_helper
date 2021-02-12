import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Speed {
  milesPerHour,
  footPerSecond,
  metrePerSecond,
  kilometrePerHour,
  knot,
}

/// Convert Speed. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final speed = convertSpeed(
///     Speed.metrePerSecond, // from
///     Speed.kilometrePerHour, // to
///     1, // value
///   );
///   print(speed); // 3.6
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#speed) for more information
double convertSpeed(Speed from, Speed to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Speed.kilometrePerHour) {
    switch (to) {
      case Speed.milesPerHour:
        return value / 1.609; // approximate
      case Speed.footPerSecond:
        return value / 1.097; // approximate
      case Speed.metrePerSecond:
        return value / 3.6;
      case Speed.knot:
        return value / 1.852;
      default:
        return value;
    }
  } else {
    final kilometrePerHour = Speed.kilometrePerHour;
    switch (from) {
      case Speed.milesPerHour:
        return convertSpeed(kilometrePerHour, to, value * 1.609);
      case Speed.footPerSecond:
        return convertSpeed(kilometrePerHour, to, value * 1.097);
      case Speed.metrePerSecond:
        return convertSpeed(kilometrePerHour, to, value * 3.6);
      case Speed.knot:
        return convertSpeed(kilometrePerHour, to, value * 1.852);
      default:
        return value;
    }
  }
}

class SpeedValues {
  final Speed from;
  final double number;

  const SpeedValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Speed to) => convertSpeed(from, to, number);

  double get toMilesPerHour => to(Speed.milesPerHour);
  double get toKilometresPerHour => to(Speed.kilometrePerHour);
  double get toFeetPerSecond => to(Speed.footPerSecond);
  double get toMetresPerSecond => to(Speed.metrePerSecond);
  double get toKnot => to(Speed.knot);
}

extension SpeedExt on num {
  SpeedValues asSpeed(Speed s) => SpeedValues(
        from: s,
        number: toDouble(),
      );
}
