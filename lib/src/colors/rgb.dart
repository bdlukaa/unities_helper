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

import 'package:unities_helper/src/colors/color.dart';
import 'package:unities_helper/src/colors/hex.dart';

class RGBAColor extends Color {
  final int red, green, blue, alpha;

  RGBAColor(
      {this.red = 255, this.green = 255, this.blue = 255, this.alpha = 255})
      : assert(red != null),
        assert(green != null),
        assert(blue != null),
        assert(alpha != null);

  String get _aHex => alpha.toRadixString(16).padLeft(2, '0');
  String get _rHex => red.toRadixString(16).padLeft(2, '0');
  String get _gHex => green.toRadixString(16).padLeft(2, '0');
  String get _bHex => blue.toRadixString(16).padLeft(2, '0');

  @override
  HEXColor get toHex => HEXColor(hex: '$_rHex$_gHex$_bHex$_aHex');

  @override
  RGBAColor get toRGB => this;
}
