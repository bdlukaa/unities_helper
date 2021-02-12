import 'package:meta/meta.dart';

import '../unities_helper_base.dart';

enum Volume {
  usLiquidGallon,
  usLiquidQuart,
  usLiquidPint,
  usLegalCup,
  usFluidOunce,
  usTablespoon,
  usTeaspoon,
  cubicMetre,
  litre,
  millilitre,
  gallon,
  imperialQuart,
  imperialPint,
  imperialCup,
  fluidOunce,
  imperialTablespoon,
  imperialTeaspoon,
  cubicFoot,
  cubicInch,
}

/// Convert Volume. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final volume = convertVolume(
///     Volume.litre, // from
///     Volume.millilitre, // to
///     1, // value
///   );
///   print(volume); // 1000
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#volume) for more information
double convertVolume(
  Volume from,
  Volume to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Volume.litre) {
    switch (to) {
      case Volume.usLiquidGallon:
        return value / 3.785;
      case Volume.usLiquidQuart:
        return value / 1.057;
      case Volume.usLiquidPint:
        return value * 2.113;
      case Volume.usLegalCup:
        return value * 4.167;
      case Volume.usFluidOunce:
        return value * 33.814;
      case Volume.usTablespoon:
        return value * 67.628;
      case Volume.usTeaspoon:
        return value * 203;
      case Volume.millilitre:
        return value * 1000;
      case Volume.gallon:
        return value / 4.546;
      case Volume.cubicFoot:
        return value / 28.317;
      case Volume.cubicInch:
        return value * 61.024;
      case Volume.imperialQuart:
        return value / 1.137;
      case Volume.imperialPint:
        return value * 1.76;
      case Volume.imperialCup:
        return value * 3.52;
      case Volume.fluidOunce:
        return value * 35.195;
      case Volume.imperialTablespoon:
        return value * 56.312;
      case Volume.imperialTeaspoon:
        return value * 169;
      default:
        return value;
    }
  } else {
    final litre = Volume.litre;
    switch (from) {
      case Volume.usLiquidGallon:
        return convertVolume(litre, to, value * 3.785);
      case Volume.usLiquidQuart:
        return convertVolume(litre, to, value * 1.057);
      case Volume.usLiquidPint:
        return convertVolume(litre, to, value / 2.113);
      case Volume.usLegalCup:
        return convertVolume(litre, to, value / 4.167);
      case Volume.usFluidOunce:
        return convertVolume(litre, to, value / 33.814);
      case Volume.usTablespoon:
        return convertVolume(litre, to, value / 67.628);
      case Volume.usTeaspoon:
        return convertVolume(litre, to, value / 203);
      case Volume.millilitre:
        return convertVolume(litre, to, value / 1000);
      case Volume.gallon:
        return convertVolume(litre, to, value * 4.546);
      case Volume.cubicFoot:
        return convertVolume(litre, to, value * 28.317);
      case Volume.cubicInch:
        return convertVolume(litre, to, value / 61.024);
      case Volume.imperialQuart:
        return convertVolume(litre, to, value * 1.137);
      case Volume.imperialPint:
        return convertVolume(litre, to, value / 1.76);
      case Volume.imperialCup:
        return convertVolume(litre, to, value / 3.52);
      case Volume.fluidOunce:
        return convertVolume(litre, to, value / 35.195);
      case Volume.imperialTablespoon:
        return convertVolume(litre, to, value / 56.312);
      case Volume.imperialTeaspoon:
        return convertVolume(litre, to, value / 169);
      default:
        return value;
    }
  }
}

class VolumeValues {
  final Volume from;
  final double number;

  const VolumeValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Volume to) => convertVolume(from, to, number);

  // TODO: premade to
}

extension VolumeExt on num {
  VolumeValues asVolume(Volume v) => VolumeValues(
        from: v,
        number: toDouble(),
      );
}
