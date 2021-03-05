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
    required this.from,
    required this.number,
  });

  double to(Volume to) => convertVolume(from, to, number);

  double get toUsLiquidGallon => to(Volume.usLiquidGallon);
  double get toUsLiquidQuart => to(Volume.usLiquidQuart);
  double get toUsLiquidPint => to(Volume.usLiquidPint);
  double get toUsLegalCup => to(Volume.usLegalCup);
  double get toUsFluidOunce => to(Volume.usFluidOunce);
  double get toUsTablespoon => to(Volume.usTablespoon);
  double get toUsTeaspoon => to(Volume.usTeaspoon);
  double get toCubicMetre => to(Volume.cubicMetre);
  double get toLitre => to(Volume.litre);
  double get toMillilitre => to(Volume.millilitre);
  double get toGallon => to(Volume.gallon);
  double get toImperialQuart => to(Volume.imperialQuart);
  double get toImperialPint => to(Volume.imperialPint);
  double get toImperialCup => to(Volume.imperialCup);
  double get toFluidOunce => to(Volume.fluidOunce);
  double get toImperialTablespoon => to(Volume.imperialTablespoon);
  double get toTeaspoon => to(Volume.imperialTeaspoon);
  double get toCubicFoot => to(Volume.cubicFoot);
  double get toCubicInch => to(Volume.cubicInch);
}

extension VolumeExt on num {
  VolumeValues asVolume(Volume v) => VolumeValues(
        from: v,
        number: toDouble(),
      );
}
