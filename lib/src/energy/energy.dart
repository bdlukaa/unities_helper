import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

/// Convert energy
enum Energy {
  joule,
  kilojoule,
  gramCalorie,
  kilocalorie,
  wattHour,
  kilowattHour,
  electronvolt,
  britishThermalUnit,
  usTherm,
  foot_pound,
}

/// Convert energy. Some decimals may be lost in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///  final energy = convertEnergy(
///    Energy.kilocalorie, // from
///    Energy.gramCalorie, // to
///    1, // value
///  );
///  print(energy); // 1000
/// }
///```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#energy) for more information
double convertEnergy(Energy from, Energy to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Energy.joule) {
    switch (to) {
      case Energy.kilojoule:
        return value / 1000;
      case Energy.gramCalorie:
        return value / 4.184;
      case Energy.kilocalorie:
        return value / 4184;
      case Energy.wattHour:
        return value / 3600;
      case Energy.kilowattHour:
        return value / 3.6e+6;
      case Energy.electronvolt:
        return value / 6.242e+18;
      case Energy.britishThermalUnit:
        return value / 1055;
      case Energy.usTherm:
        return value / 1.055e+8;
      case Energy.foot_pound:
        return value / 1.356;
      default:
        return value;
    }
  } else {
    final joule = Energy.joule;
    switch (from) {
      case Energy.kilojoule:
        return convertEnergy(joule, to, value * 1000);
      case Energy.gramCalorie:
        return convertEnergy(joule, to, value * 4.184);
      case Energy.kilocalorie:
        return convertEnergy(joule, to, value * 4184);
      case Energy.wattHour:
        return convertEnergy(joule, to, value * 3600);
      case Energy.kilowattHour:
        return convertEnergy(joule, to, value * 3.6e+6);
      case Energy.electronvolt:
        return convertEnergy(joule, to, value * 6.242e+18);
      case Energy.britishThermalUnit:
        return convertEnergy(joule, to, value * 1055);
      case Energy.usTherm:
        return convertEnergy(joule, to, value * 1.055e+8);
      case Energy.foot_pound:
        return convertEnergy(joule, to, value * 1.356);
      default:
        return value;
    }
  }
}

class EnergyValues {
  final Energy from;
  final double number;

  const EnergyValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Energy to) => convertEnergy(from, to, number);

  double get toJoule => to(Energy.joule);
  double get toKilojoule => to(Energy.kilojoule);
  double get toGramCalorie => to(Energy.gramCalorie);
  double get toKilocalorie => to(Energy.kilocalorie);
  double get toWatthour => to(Energy.wattHour);
  double get toKilowattHour => to(Energy.kilowattHour);
  double get toElectronVolt => to(Energy.electronvolt);
  double get toBritishThermalUnit => to(Energy.britishThermalUnit);
  double get toUStherm => to(Energy.usTherm);
  double get toFootPound => to(Energy.foot_pound);
}

extension EnergyExt on num {
  /// Convert [this] as an [EnergyValues]. Basic usage:
  /// ```dart
  /// final footPound = 10.asEnergy(Energy.joule).toFootPound;
  /// ```
  EnergyValues asEnergy(Energy energy) => EnergyValues(
        from: energy,
        number: toDouble(),
      );
}
