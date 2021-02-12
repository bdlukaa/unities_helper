import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

enum Temperature { celcius, fahrenheit, kelvin }

/// Convert Temperature. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final temperature = convertTemperature(
///     Temperature.celcius, // from
///     Temperature.fahrenheit, // to
///     0, // value
///   );
///   print(temperature); // 32
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#temperature) for more information
double convertTemperature(Temperature from, Temperature to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Temperature.celcius) {
    if (to == Temperature.fahrenheit) return (value * 9 / 5) + 32;
    if (to == Temperature.kelvin) return value + 273.15;
  } else if (from == Temperature.fahrenheit) {
    if (to == Temperature.celcius) return (value - 32) * 5 / 9;
    if (to == Temperature.kelvin) return (value - 32) * 5 / 9 + 273.15;
  } else if (from == Temperature.kelvin) {
    if (to == Temperature.celcius) return value - 273.15;
    if (to == Temperature.fahrenheit) return (value - 273.15) * 9 / 5 + 32;
  }
  return value;
}

class TemperatureValues {
  final Temperature from;
  final double number;

  const TemperatureValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Temperature to) => convertTemperature(from, to, number);

  double get toFahrenheit => to(Temperature.fahrenheit);
  double get toCelcius => to(Temperature.celcius);
  double get toKelvin => to(Temperature.kelvin);
}

extension TempExt on num {
  TemperatureValues asTemperature(Temperature temp) => TemperatureValues(
        from: temp,
        number: toDouble(),
      );
}
