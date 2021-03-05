import '../unities_helper_base.dart' show verify;

enum Area {
  /// km²
  squareKilometre,

  /// m²
  squareMetre,

  /// mi²
  squareMile,

  /// yd²
  squareYard,

  /// ft²
  squareFoot,

  /// in²
  squareInch,
  hectare,
  acre
}

/// Convert area. It may lose some decimals in the proccess.
///
/// `from`, `to` and `value` can NOT be null, otherwise
/// an [AssertionError] is thrown
///
/// Basic usage:
/// ```dart
/// main() {
///   final area = convertArea(
///     Area.squareMetre, // from
///     Area.squareKilometre, // to
///     10000000, // value
///   );
///   print(area); // 10
/// }
/// ```
///
/// [Read the documentation](https://github.com/bdlukaa/unities_helper#area) for more information
double convertArea(Area from, Area to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Area.squareMetre) {
    switch (to) {
      case Area.squareKilometre:
        return value / 1e+6;
      case Area.squareMile:
        return value / 2.59e+6;
      case Area.squareYard:
        return value * 1.196;
      case Area.squareFoot:
        return value * 10.764;
      case Area.squareInch:
        return value * 1550;
      case Area.hectare:
        return value / 10000;
      case Area.acre:
        return value / 4047;
      default:
        return value;
    }
  } else {
    final squareMetre = Area.squareMetre;
    switch (from) {
      case Area.squareKilometre:
        return convertArea(squareMetre, to, value * 1e+6);
      case Area.squareMile:
        return convertArea(squareMetre, to, value * 2.59e+6);
      case Area.squareYard:
        return convertArea(squareMetre, to, value / 1.196);
      case Area.squareFoot:
        return convertArea(squareMetre, to, value / 10.764);
      case Area.squareInch:
        return convertArea(squareMetre, to, value / 1550);
      case Area.hectare:
        return convertArea(squareMetre, to, value * 10000);
      case Area.acre:
        return convertArea(squareMetre, to, value * 4047);
      default:
        return value;
    }
  }
}

class AreaValues {
  final Area from;
  final double number;

  const AreaValues({
    required this.from,
    required this.number,
  });

  double to(Area to) => convertArea(from, to, number);

  double get toSquareKilometre => to(Area.squareKilometre);
  double get toSquareMetre => to(Area.squareMetre);
  double get toSquareMile => to(Area.squareMile);
  double get toSquareYard => to(Area.squareYard);
  double get toSquareFoot => to(Area.squareFoot);
  double get toSquareInch => to(Area.squareInch);
  double get toHectare => to(Area.hectare);
  double get toAcre => to(Area.acre);
}

extension AreaExt on num {
  AreaValues asArea(Area area) => AreaValues(
        from: area,
        number: toDouble(),
      );
}
