//
// Copyright 2020 Bruno D'Luka
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// 1. Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// 2. Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation and/or 
// other materials provided with the distribution.
// 
// 3. Neither the name of the copyright holder nor the names of its contributors 
// may be used to endorse or promote products derived from this software without 
// specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, 
// OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

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
  RGBAColor get toRGB;

  HEXColor get toHex => toRGB.toHex;

  HSVColor get toHSV => toHSLA.toHSV;

  HSLAColor get toHSLA {
    final r = toRGB.red;
    final g = toRGB.green;
    final b = toRGB.blue;

    var cmin = math.min(math.min(r, g), b),
        cmax = math.max(math.max(r, g), b),
        delta = cmax - cmin;
    // ignore: omit_local_variable_types
    double h = 0, s = 0, l = 0;

    if (delta == 0)
      // ignore: curly_braces_in_flow_control_structures
      h = 0;
    else if (cmax == r)
      // ignore: curly_braces_in_flow_control_structures
      h = ((g - b) / delta) % 6;
    else if (cmax == g)
      // ignore: curly_braces_in_flow_control_structures
      h = (b - r) / delta + 2;
    else
      // ignore: curly_braces_in_flow_control_structures
      h = (r - g) / delta + 4;

    h = (h * 60).roundToDouble();

    if (h < 0) h += 360;

    l = (cmax + cmin) / 2;

    // Calculate saturation
    s = delta == 0 ? 0 : delta / (1 - (2 * l - 1).abs());

    // Multiply l and s by 100
    s += (s * 100).toFixed(1);
    l += (l * 100).toFixed(1);
    return HSLAColor(
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

extension numExtension on num {
  num toFixed(int digits) {
    return num.parse(toStringAsFixed(digits));
  }
}
