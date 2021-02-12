import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

/// Length
enum Length {
  nanometer,
  micrometer,
  millimeter,
  centimeter,
  meter,
  kilometer,
  inch,
  mile,
  yard,
  feet,
  nautical_mile,
}

/// Convert Length. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///  final length = convertLength(
///    Length.centimeter, // from
///    Length.meter, // to
///    100, // value
///  );
///  print(length); // 1
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#length) for more information
double convertLength(Length from, Length to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Length.meter) {
    switch (to) {
      case Length.centimeter:
        return value * 100;
      case Length.kilometer:
        return value / 1000;
      case Length.millimeter:
        return value * 1000;
      case Length.micrometer:
        return value * 1e+6;
      case Length.nanometer:
        return value * 1e+9; // approach
      case Length.mile:
        return value / 1609; // approach
      case Length.yard:
        return value * 1.094; // approach
      case Length.feet:
        return value * 3.281; // approach
      case Length.inch:
        return value * 39.37;
      case Length.nautical_mile:
        return value / 1852;
      case Length.meter:
        return value;
      default:
        return value;
    }
  } else {
    switch (from) {
      case Length.centimeter:
        return convertLength(Length.meter, to, value * 100);
      case Length.kilometer:
        return convertLength(Length.meter, to, value * 1000);
      case Length.millimeter:
        return convertLength(Length.meter, to, value / 1000);
      case Length.micrometer:
        return convertLength(Length.meter, to, value / 1e+6);
      case Length.nanometer:
        return convertLength(Length.meter, to, value / 1e+9); // approach
      case Length.mile:
        return convertLength(Length.meter, to, value * 1609); // approach
      case Length.yard:
        return convertLength(Length.meter, to, value / 1.094); // approach
      case Length.feet:
        return convertLength(Length.meter, to, value / 3.281); // approach
      case Length.inch:
        return convertLength(Length.meter, to, value / 39.37);
      case Length.nautical_mile:
        return convertLength(Length.meter, to, value * 1852);
      default:
        return value;
    }
  }
}

class LengthValues {
  final Length from;
  final num number;

  const LengthValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Length to) => convertLength(from, to, number);

  double get toNanometer => to(Length.nanometer);
  double get toMicrometer => to(Length.micrometer);
  double get toMillimeter => to(Length.millimeter);
  double get toCentimeter => to(Length.centimeter);
  double get toMeter => to(Length.meter);
  double get toKilometer => to(Length.kilometer);
  double get toInch => to(Length.inch);
  double get toMile => to(Length.mile);
  double get toYard => to(Length.yard);
  double get toFeet => to(Length.feet);
  double get toNauticalMile => to(Length.nautical_mile);
}

extension LengthExt on num {
  LengthValues asLength(Length length) => LengthValues(
        from: length,
        number: this,
      );
}
