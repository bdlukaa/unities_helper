import '../unities_helper_base.dart';

enum DigitalStorage {
  bit,
  byte,
  kilobit,
  kibibit,
  kilobyte,
  kibibyte,
  megabit,
  mebibit,
  megabyte,
  mebibyte,
  gigabit,
  gibibit,
  gigabyte,
  gibibyte,
  terabit,
  tebibit,
  terabyte,
  tebibyte,
  petabit,
  pebibit,
  petabyte,
  pebibyte,
}

/// Convert digital storage. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final storage = convertDigitalStorage(
///     DigitalStorage.gigabyte, // from
///     DigitalStorage.megabyte, // to
///     1, // value
///   );
///   print(storage); // 1000
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#digital-storage) for more information
double convertDigitalStorage(
  DigitalStorage from,
  DigitalStorage to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == DigitalStorage.bit) {
    switch (to) {
      case DigitalStorage.byte:
        return value / 8;
      case DigitalStorage.kilobit:
        return value / 1000;
      case DigitalStorage.kilobyte:
        return value / 8000;
      case DigitalStorage.kibibit:
        return value / 1024;
      case DigitalStorage.kibibyte:
        return value / 8192;
      case DigitalStorage.megabit:
        return value / 1e+6;
      case DigitalStorage.megabyte:
        return value / 8e+6;
      case DigitalStorage.mebibit:
        return value / 1.049e+6;
      case DigitalStorage.mebibyte:
        return value / 8.389e+6;
      case DigitalStorage.gigabit:
        return value / 1e+9;
      case DigitalStorage.gigabyte:
        return value / 8e+9;
      case DigitalStorage.gibibit:
        return value / 1.074e+9;
      case DigitalStorage.gibibyte:
        return value / 8.59e+9;
      case DigitalStorage.terabit:
        return value / 1e+12;
      case DigitalStorage.terabyte:
        return value / 8e+12;
      case DigitalStorage.tebibit:
        return value / 1.1e+12;
      case DigitalStorage.tebibyte:
        return value / 8.796e+12;
      case DigitalStorage.petabit:
        return value / 1e+15;
      case DigitalStorage.petabyte:
        return value / 8e+15;
      case DigitalStorage.pebibit:
        return value / 1.126e+15;
      case DigitalStorage.pebibyte:
        return value / 9.007e+15;
      default:
        return value;
    }
  } else {
    final bit = DigitalStorage.bit;
    switch (from) {
      case DigitalStorage.byte:
        return convertDigitalStorage(bit, to, value * 8);
      case DigitalStorage.kilobit:
        return convertDigitalStorage(bit, to, value * 1000);
      case DigitalStorage.kilobyte:
        return convertDigitalStorage(bit, to, value * 8000);
      case DigitalStorage.kibibit:
        return convertDigitalStorage(bit, to, value * 1024);
      case DigitalStorage.kibibyte:
        return convertDigitalStorage(bit, to, value * 8192);
      case DigitalStorage.megabit:
        return convertDigitalStorage(bit, to, value * 1e+6);
      case DigitalStorage.megabyte:
        return convertDigitalStorage(bit, to, value * 8e+6);
      case DigitalStorage.mebibit:
        return convertDigitalStorage(bit, to, value * 1.049e+6);
      case DigitalStorage.mebibyte:
        return convertDigitalStorage(bit, to, value * 8.389e+6);
      case DigitalStorage.gigabit:
        return convertDigitalStorage(bit, to, value * 1e+9);
      case DigitalStorage.gigabyte:
        return convertDigitalStorage(bit, to, value * 8e+9);
      case DigitalStorage.gibibit:
        return convertDigitalStorage(bit, to, value * 1.074e+9);
      case DigitalStorage.gibibyte:
        return convertDigitalStorage(bit, to, value * 8.59e+9);
      case DigitalStorage.terabit:
        return convertDigitalStorage(bit, to, value * 1e+12);
      case DigitalStorage.terabyte:
        return convertDigitalStorage(bit, to, value * 8e+12);
      case DigitalStorage.tebibit:
        return convertDigitalStorage(bit, to, value * 1.1e+12);
      case DigitalStorage.tebibyte:
        return convertDigitalStorage(bit, to, value * 8.796e+12);
      case DigitalStorage.petabit:
        return convertDigitalStorage(bit, to, value * 1e+15);
      case DigitalStorage.petabyte:
        return convertDigitalStorage(bit, to, value * 8e+15);
      case DigitalStorage.pebibit:
        return convertDigitalStorage(bit, to, value * 1.126e+15);
      case DigitalStorage.pebibyte:
        return convertDigitalStorage(bit, to, value * 9.007e+15);
      default:
        return value;
    }
  }
}

class DigitalStorageValues {
  final DigitalStorage from;
  final double number;

  const DigitalStorageValues({
    required this.from,
    required this.number,
  });

  double to(DigitalStorage to) => convertDigitalStorage(from, to, number);

  double get toBit => to(DigitalStorage.bit);
  double get toByte => to(DigitalStorage.byte);
  double get toKilobit => to(DigitalStorage.kilobit);
  double get toKibibit => to(DigitalStorage.kibibit);
  double get toKilobyte => to(DigitalStorage.kilobyte);
  double get toKibibyte => to(DigitalStorage.kibibyte);
  double get toMegabit => to(DigitalStorage.megabit);
  double get toMebibit => to(DigitalStorage.mebibit);
  double get toMegabyte => to(DigitalStorage.megabyte);
  double get toMebibyte => to(DigitalStorage.mebibyte);
  double get toGigabit => to(DigitalStorage.gigabit);
  double get toGibibit => to(DigitalStorage.gibibit);
  double get toGigabyte => to(DigitalStorage.gigabyte);
  double get toGibibyte => to(DigitalStorage.gibibyte);
  double get toTerabit => to(DigitalStorage.terabit);
  double get toTebibit => to(DigitalStorage.tebibit);
  double get toTerabyte => to(DigitalStorage.terabyte);
  double get toTebibyte => to(DigitalStorage.tebibyte);
  double get toPetabit => to(DigitalStorage.petabit);
  double get toPebibit => to(DigitalStorage.pebibit);
  double get toPetabyte => to(DigitalStorage.petabyte);
  double get toPebibyte => to(DigitalStorage.pebibyte);
}

extension DigitalStorageExt on num {
  DigitalStorageValues asVolume(DigitalStorage v) => DigitalStorageValues(
        from: v,
        number: toDouble(),
      );
}
