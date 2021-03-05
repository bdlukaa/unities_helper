import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
///
/// Learn more about frequencies [here](https://en.wikipedia.org/wiki/Hertz)
enum Frequency { hertz, kilohertz, megahertz, gigahertz }

/// Convert frequencies. Some decimals may be lost in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final frequency = convertEnergy(
///     Frequency.megahertz, // from
///     Frequency.hertz, // to
///     1, // value
///   );
///   print(frequency); // 1000000
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#frequency) for more information
double convertFrequency(Frequency from, Frequency to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Frequency.hertz) {
    switch (to) {
      case Frequency.gigahertz:
        return value / 1e+9;
      case Frequency.kilohertz:
        return value / 1000;
      case Frequency.megahertz:
        return value / 1e+6;
      default:
        return value;
    }
  } else {
    final hertz = Frequency.hertz;
    switch (from) {
      case Frequency.gigahertz:
        return convertFrequency(hertz, to, value * 1e+9);
      case Frequency.kilohertz:
        return convertFrequency(hertz, to, value * 1000);
      case Frequency.megahertz:
        return convertFrequency(hertz, to, value * 1e+6);
      default:
        return value;
    }
  }
}

class FrequencyValues {
  final Frequency from;
  final double number;

  const FrequencyValues({
    required this.from,
    required this.number,
  });

  double to(Frequency to) => convertFrequency(from, to, number);

  double get toHertz => to(Frequency.hertz);
  double get toKilohertz => to(Frequency.kilohertz);
  double get toMegahertz => to(Frequency.megahertz);
  double get toGigahertz => to(Frequency.gigahertz);
}

extension FrequencyExt on num {
  /// Convert [this] as an [FrequencyValues]. Basic usage:
  /// ```dart
  /// final megahertz = 10.asFrequency(Frequency.hertz).toMegahertz;
  /// ```
  FrequencyValues asFrequency(Frequency frequency) => FrequencyValues(
        from: frequency,
        number: toDouble(),
      );
}
