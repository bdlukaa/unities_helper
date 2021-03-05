import '../unities_helper_base.dart' show verify;

/// Data tranfer rate per second
enum DataTransferRate {
  bit,
  kilobit,
  kilobyte,
  kibibit,
  megabit,
  megabyte,
  mebibit,
  gigabit,
  gigabyte,
  gibibit,
  terabit,
  terabyte,
  tebibit,
}

/// Convert data tranfer rate per second.
/// It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null,
/// otherwise an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final rate = convertDataTransferRate(
///     DataTransferRate.gigabyte, // from
///     DataTransferRate.megabyte, // to
///     1, // value
///   );
///   print(rate); // 1000
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#data-transfer-rate) for more information
double convertDataTransferRate(
  DataTransferRate from,
  DataTransferRate to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == DataTransferRate.bit) {
    switch (to) {
      case DataTransferRate.kilobit:
        return value / 1000;
      case DataTransferRate.kilobyte:
        return value / 8000;
      case DataTransferRate.kibibit:
        return value / 1024;
      case DataTransferRate.megabit:
        return value / 1e+6;
      case DataTransferRate.megabyte:
        return value / 8e+6;
      case DataTransferRate.mebibit:
        return value / 1.049e+6;
      case DataTransferRate.gigabit:
        return value / 1e+9;
      case DataTransferRate.gigabyte:
        return value / 8e+9;
      case DataTransferRate.gibibit:
        return value / 1.074e+9;
      case DataTransferRate.terabit:
        return value / 1e+12;
      case DataTransferRate.terabyte:
        return value / 8e+12;
      case DataTransferRate.tebibit:
        return value / 1.1e+12;
      default:
        return value;
    }
  } else {
    final bit = DataTransferRate.bit;
    switch (from) {
      case DataTransferRate.kilobit:
        return convertDataTransferRate(bit, to, value * 1000);
      case DataTransferRate.kilobyte:
        return convertDataTransferRate(bit, to, value * 8000);
      case DataTransferRate.kibibit:
        return convertDataTransferRate(bit, to, value * 1024);
      case DataTransferRate.megabit:
        return convertDataTransferRate(bit, to, value * 1e+6);
      case DataTransferRate.megabyte:
        return convertDataTransferRate(bit, to, value * 8e+6);
      case DataTransferRate.mebibit:
        return convertDataTransferRate(bit, to, value * 1.049e+6);
      case DataTransferRate.gigabit:
        return convertDataTransferRate(bit, to, value * 1e+9);
      case DataTransferRate.gigabyte:
        return convertDataTransferRate(bit, to, value * 8e+9);
      case DataTransferRate.gibibit:
        return convertDataTransferRate(bit, to, value * 1.074e+9);
      case DataTransferRate.terabit:
        return convertDataTransferRate(bit, to, value * 1e+12);
      case DataTransferRate.terabyte:
        return convertDataTransferRate(bit, to, value * 8e+12);
      case DataTransferRate.tebibit:
        return convertDataTransferRate(bit, to, value * 1.1e+12);
      default:
        return value;
    }
  }
}

class DataTransferRateValues {
  final DataTransferRate from;
  final double number;

  const DataTransferRateValues({
    required this.from,
    required this.number,
  });

  double to(DataTransferRate to) => convertDataTransferRate(from, to, number);

  double get toBit => to(DataTransferRate.bit);
  double get toKilobit => to(DataTransferRate.kilobit);
  double get toKilobyte => to(DataTransferRate.kilobyte);
  double get toKibibit => to(DataTransferRate.kibibit);
  double get toMegabit => to(DataTransferRate.megabit);
  double get toMegabyte => to(DataTransferRate.megabyte);
  double get toMebibit => to(DataTransferRate.mebibit);
  double get toGigabit => to(DataTransferRate.gigabit);
  double get toGigabyte => to(DataTransferRate.gigabyte);
  double get toGibibit => to(DataTransferRate.gibibit);
  double get toTerabit => to(DataTransferRate.terabit);
  double get toTerabyte => to(DataTransferRate.terabyte);
  double get toTebibit => to(DataTransferRate.tebibit);
}

extension DataTransferRateExt on num {
  DataTransferRateValues asDataTransferRate(DataTransferRate data) =>
      DataTransferRateValues(
        from: data,
        number: toDouble(),
      );
}
