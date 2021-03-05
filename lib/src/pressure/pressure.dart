import '../unities_helper_base.dart' show verify;

enum Pressure { bar, pascal, torr, poundForcePerSquareInch, standartAtmosphere }

/// Convert Pressure. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final pressure = convertPressure(
///     Pressure.bar, // from
///     Pressure.pascal, // to
///     1, // value
///   );
///   print(pressure); // 100000
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#pressure) for more information
double convertPressure(Pressure from, Pressure to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Pressure.pascal) {
    switch (to) {
      case Pressure.bar:
        return value / 100000;
      case Pressure.poundForcePerSquareInch:
        return value / 6895; // approximate
      case Pressure.standartAtmosphere:
        return value / 101325;
      case Pressure.torr:
        return value / 133;
      default:
        return value;
    }
  } else {
    final pascal = Pressure.pascal;
    switch (from) {
      case Pressure.bar:
        return convertPressure(pascal, to, value * 100000);
      case Pressure.poundForcePerSquareInch:
        return convertPressure(pascal, to, value * 6895);
      case Pressure.standartAtmosphere:
        return convertPressure(pascal, to, value * 101325);
      case Pressure.torr:
        return convertPressure(pascal, to, value * 133);
      default:
        return value;
    }
  }
}

class PressureValues {
  final Pressure from;
  final double number;

  const PressureValues({
    required this.from,
    required this.number,
  });

  double to(Pressure to) => convertPressure(from, to, number);

  double get toBar => to(Pressure.bar);
  double get toPascal => to(Pressure.pascal);
  double get toTorr => to(Pressure.torr);
  double get toPoundForcePerSquareInch => to(Pressure.poundForcePerSquareInch);
  double get toStandartAtmosphere => to(Pressure.standartAtmosphere);
}

extension PressureExt on num {
  PressureValues asPressure(Pressure p) => PressureValues(
        from: p,
        number: toDouble(),
      );
}
