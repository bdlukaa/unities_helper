import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

/// Fuel economy
enum FuelEconomy {
  kilometerPerLitre,
  literPer100Kilometres,
  milePerUsGallon,
  milePerImperialGallon
}

/// Convert Fuel economy. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///  final fuel = convertFuelEconomy(
///    FuelEconomy.kilometerPerLitre, // from
///    FuelEconomy.milePerUsGallon, // to
///    1, // value
///  );
///  print(fuel); // 2,35215
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#fuel-economy) for more information
double convertFuelEconomy(
  FuelEconomy from,
  FuelEconomy to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == FuelEconomy.kilometerPerLitre) {
    switch (to) {
      case FuelEconomy.literPer100Kilometres:
        return value * 100;
      case FuelEconomy.milePerUsGallon:
        return value * 2.352;
      case FuelEconomy.milePerImperialGallon:
        return value * 2.825;
      default:
        return value;
    }
  } else {
    // always convert to liter per liter
    // to convert to the needed value
    // may lost a few decimals in the proccess
    final litre = FuelEconomy.kilometerPerLitre;
    switch (from) {
      case FuelEconomy.literPer100Kilometres:
        return convertFuelEconomy(litre, to, value / 100);
      case FuelEconomy.milePerUsGallon:
        return convertFuelEconomy(litre, to, value / 2.352);
      case FuelEconomy.milePerImperialGallon:
        return convertFuelEconomy(litre, to, value / 2.825);
      default:
        return value;
    }
  }
}

class FuelEconomyValues {
  final FuelEconomy from;
  final num number;

  const FuelEconomyValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(FuelEconomy to) => convertFuelEconomy(from, to, number);

  double get toKilometerPerLitre => to(FuelEconomy.kilometerPerLitre);
  double get toLiterPer100Kilometres => to(FuelEconomy.literPer100Kilometres);
  double get toMilePerUsGallon => to(FuelEconomy.milePerUsGallon);
  double get toMilePerImperialGallon => to(FuelEconomy.milePerImperialGallon);
}

extension FuelEconomyExt on num {
  FuelEconomyValues asArea(FuelEconomy fuel) => FuelEconomyValues(
        from: fuel,
        number: this,
      );
}
