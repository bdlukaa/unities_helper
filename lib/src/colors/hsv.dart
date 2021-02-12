import 'color.dart';

class HSVColor extends Color {
  /// The alpha value. Must be in range of 0 and 1.
  /// If null, an [AssertionError] is thrown
  final double alpha;

  /// The hue value. Must be in range of 0 and 360
  /// If null, an [AssertionError] is thrown
  final double hue;

  /// The saturation value. Must be in range of 0 and 1.
  /// If null, an [AssertionError] is thrown
  final double saturation;

  /// The `value` value. Must be in range of 0 and 1.
  /// If null, an [AssertionError] is thrown
  final double value;

  const HSVColor({
    this.alpha = 1,
    this.hue = 360,
    this.saturation = 1,
    this.value = 1,
  })  : assert(alpha != null),
        assert(hue != null),
        assert(saturation != null),
        assert(value != null),
        assert(alpha >= 0 && alpha <= 1),
        assert(hue >= 0 && hue <= 360),
        assert(value >= 0 && value <= 1),
        assert(saturation >= 0 && saturation <= 1);

  @override
  RGBAColor get toRGB {
    final chroma = saturation * value;
    final secondary = chroma * (1.0 - (((hue / 60.0) % 2.0) - 1.0).abs());
    final match = value - chroma;
    return rgbaColorFromHue(alpha, hue, chroma, secondary, match);
  }

  @override
  String toString() => 'hsva($hue, $saturation, $value, $alpha)';
}
