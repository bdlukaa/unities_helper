import 'color.dart';
import 'dart:math';

class HSLColor extends Color {
  /// The alpha value. Must be in range of 0 and 1.
  /// If null, an [AssertionError] is thrown
  final double alpha;

  /// The hue value. Must be in range of 0 and 360
  /// If null, an [AssertionError] is thrown
  final double hue;

  /// The saturation value. Must be in range of 0 and 1
  /// If null, an [AssertionError] is thrown
  final double saturation;

  /// The lightness value. Must be in range of 0 and 1
  /// If null, an [AssertionError] is thrown
  final double lightness;

  const HSLColor({
    this.alpha = 1,
    this.hue = 360,
    this.saturation = 1,
    this.lightness = 1,
  })  : assert(alpha != null),
        assert(hue != null),
        assert(saturation != null),
        assert(lightness != null),
        assert(alpha >= 0 && alpha <= 1),
        assert(hue >= 0 && hue <= 360),
        assert(lightness >= 0 && lightness <= 1),
        assert(saturation >= 0 && saturation <= 1);

  @override
  RGBAColor get toRGB {
    final chroma = (1.0 - (2.0 * lightness - 1.0).abs()) * saturation;
    final secondary = chroma * (1.0 - (((hue / 60.0) % 2.0) - 1.0).abs());
    final match = lightness - chroma / 2.0;
    return rgbaColorFromHue(alpha, hue, chroma, secondary, match);
  }

  @override
  HSVColor get toHSV {
    final hslSaturation = this.saturation / 100;
    final lightness = this.lightness / 100;

    final value = lightness + hslSaturation * min(lightness, 1 - lightness);
    final saturation = value == 0 ? 0 : 2 * (1 - lightness / value);

    return HSVColor(hue: hue, saturation: saturation * 100, value: value * 100);
  }

  @override
  String toString() => 'hsla($hue, $saturation, $lightness, $alpha)';
}
