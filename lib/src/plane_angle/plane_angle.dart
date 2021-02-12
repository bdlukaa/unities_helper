import 'dart:math';

import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

enum PlaneAngle {
  degree,
  gradian,
  milliradian,
  radian,
  minuteOfArc,
  secondOfArc,
}

/// Convert Plane Angle. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final angle = convertPlaneAngle(
///     PlaneAngle.degree, // from
///     PlaneAngle.minuteOfArc, // to
///     1, // value
///   );
///   print(angle); // 60
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#plane-angle) for more information
double convertPlaneAngle(PlaneAngle from, PlaneAngle to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == PlaneAngle.degree) {
    switch (to) {
      case PlaneAngle.gradian:
        return value * 200 / 180;
      case PlaneAngle.milliradian:
        return value * (1000 * pi) / 180;
      case PlaneAngle.radian:
        return value * 60;
      case PlaneAngle.minuteOfArc:
        return value * (pi / 180);
      case PlaneAngle.secondOfArc:
        return value * 3600;
      default:
        return value;
    }
  } else {
    final degree = PlaneAngle.degree;
    switch (from) {
      case PlaneAngle.gradian:
        return convertPlaneAngle(degree, to, value * 200 / 180);
      case PlaneAngle.milliradian:
        return convertPlaneAngle(degree, to, value * (1000 * pi) / 180);
      case PlaneAngle.radian:
        return convertPlaneAngle(degree, to, value * 60);
      case PlaneAngle.minuteOfArc:
        return convertPlaneAngle(degree, to, value * (pi / 180));
      case PlaneAngle.secondOfArc:
        return convertPlaneAngle(degree, to, value * 3600);
      default:
        return value;
    }
  }
}

class PlaneAngleValues {
  final PlaneAngle from;
  final num number;

  const PlaneAngleValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(PlaneAngle to) => convertPlaneAngle(from, to, number);

  double get toDegree => to(PlaneAngle.degree);
  double get toGradian => to(PlaneAngle.gradian);
  double get toMilliradian => to(PlaneAngle.milliradian);
  double get toRadian => to(PlaneAngle.radian);
  double get toMinuteOfArc => to(PlaneAngle.minuteOfArc);
  double get toSecondOfArc => to(PlaneAngle.secondOfArc);
}

extension PlaneAngleExt on num {
  PlaneAngleValues asPlaneAngle(PlaneAngle angle) => PlaneAngleValues(
        from: angle,
        number: this,
      );
}
