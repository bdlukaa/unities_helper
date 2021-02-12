import 'package:meta/meta.dart';

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Mass {
  tonne,
  gram,
  kilogram,
  milligram,
  microgram,
  imperialTon,
  usTon,
  stone,
  pound,
  ounce,
}

/// Convert Mass. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///  final mass = convertMass(
///    Mass.kilogram, // from
///    Mass.gram, // to
///    1, // value
///  );
///  print(mass); // 1000
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#mass) for more information
double convertMass(Mass from, Mass to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Mass.gram) {
    switch (to) {
      case Mass.tonne:
        return value / 1e+9;
      case Mass.kilogram:
        return value / 1000;
      case Mass.milligram:
        return value * 1000;
      case Mass.microgram:
        return value * 1e+6;
      case Mass.imperialTon:
        return value / 1.016e+6;
      case Mass.usTon:
        return value / 907185;
      case Mass.stone:
        return value / 6350;
      case Mass.pound:
        return value / 454;
      case Mass.ounce:
        return value / 28.35;
      default:
        return value;
    }
  } else {
    final gram = Mass.gram;
    switch (from) {
      case Mass.tonne:
        return convertMass(gram, to, value * 1e+9);
      case Mass.kilogram:
        return convertMass(gram, to, value * 1000);
      case Mass.milligram:
        return convertMass(gram, to, value / 1000);
      case Mass.microgram:
        return convertMass(gram, to, value / 1e+6);
      case Mass.imperialTon:
        return convertMass(gram, to, value * 1.016e+6);
      case Mass.usTon:
        return convertMass(gram, to, value * 907185);
      case Mass.stone:
        return convertMass(gram, to, value * 6350);
      case Mass.pound:
        return convertMass(gram, to, value * 454);
      case Mass.ounce:
        return convertMass(gram, to, value * 28.35);
      default:
        return value;
    }
  }
}

class MassValues {
  final Mass from;
  final num number;

  const MassValues({
    @required this.from,
    @required this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Mass to) => convertMass(from, to, number);

  double get toTonne => to(Mass.tonne);
  double get toGram => to(Mass.gram);
  double get toKilogram => to(Mass.kilogram);
  double get toMilligram => to(Mass.milligram);
  double get toMicrogram => to(Mass.microgram);
  double get toImperialTon => to(Mass.imperialTon);
  double get toUSTon => to(Mass.usTon);
  double get toStone => to(Mass.stone);
  double get toPound => to(Mass.pound);
  double get toOunce => to(Mass.ounce);
}

extension MassExt on num {
  MassValues asMass(Mass mass) => MassValues(
        from: mass,
        number: this,
      );
}
