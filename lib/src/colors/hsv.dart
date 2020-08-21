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

import 'package:unities_helper/src/colors/rgb.dart';

import 'color.dart';

class HSVColor extends Color {
  final double alpha, hue, saturation, value;

  HSVColor({
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

}