import 'hex.dart';
import 'hsv.dart';
import 'rgb.dart';
import 'hsl.dart';

export 'hsl.dart';
export 'hex.dart';
export 'hsv.dart';
export 'rgb.dart';

import 'dart:math' as math;

abstract class Color {
  const Color();

  /// Convert [this] to a RGBA color space
  RGBAColor get toRGB;

  /// Convert [this] to a HEX color space
  HEXColor get toHex => toRGB.toHex;

  /// Convert [this] to a HSV color space
  HSVColor get toHSV => toHSL.toHSV;

  /// Convert [this] to a HSL color space
  HSLColor get toHSL {
    /// Code copied from `HSLColor` in the flutter repository
    final rgb = toRGB;
    final r = rgb.red;
    final g = rgb.green;
    final b = rgb.blue;

    var cmin = math.min(math.min(r, g), b),
        cmax = math.max(math.max(r, g), b),
        delta = cmax - cmin;
    var h = 0.0, s = 0.0, l = 0.0;

    if (delta == 0) {
      h = 0;
    } else if (cmax == r) {
      h = ((g - b) / delta) % 6;
    } else if (cmax == g) {
      h = (b - r) / delta + 2;
    } else {
      h = (r - g) / delta + 4;
    }

    h = (h * 60).roundToDouble();

    if (h < 0) h += 360;

    l = (cmax + cmin) / 2;

    // Calculate saturation
    s = delta == 0 ? 0 : delta / (1 - (2 * l - 1).abs());

    // Multiply l and s by 100
    s += (s * 100).toFixed(1);
    l += (l * 100).toFixed(1);
    return HSLColor(
      alpha: toRGB.alpha.toDouble(),
      hue: h,
      saturation: s,
      lightness: l,
    );
  }
}

RGBAColor rgbaColorFromHue(
  double alpha,
  double hue,
  double chroma,
  double secondary,
  double match,
) {
  double red;
  double green;
  double blue;
  if (hue < 60.0) {
    red = chroma;
    green = secondary;
    blue = 0.0;
  } else if (hue < 120.0) {
    red = secondary;
    green = chroma;
    blue = 0.0;
  } else if (hue < 180.0) {
    red = 0.0;
    green = chroma;
    blue = secondary;
  } else if (hue < 240.0) {
    red = 0.0;
    green = secondary;
    blue = chroma;
  } else if (hue < 300.0) {
    red = secondary;
    green = 0.0;
    blue = chroma;
  } else {
    red = chroma;
    green = 0.0;
    blue = secondary;
  }
  return RGBAColor(
    alpha: (alpha * 0xFF).round(),
    red: ((red + match) * 0xFF).round(),
    green: ((green + match) * 0xFF).round(),
    blue: ((blue + match) * 0xFF).round(),
  );
}

extension _NumExtension on num {
  num toFixed(int digits) {
    return num.parse(toStringAsFixed(digits));
  }
}
