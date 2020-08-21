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

// frequency

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Frequency { hertz, kilohertz, megahertz, gigahertz }

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
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
  num number;

  FrequencyValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Frequency to) => convertFrequency(from, to, number);
  
  double get toHertz => to(Frequency.hertz);
  double get toKilohertz => to(Frequency.kilohertz);
  double get toMegahertz => to(Frequency.megahertz);
  double get toGigahertz => to(Frequency.gigahertz);
}

extension FrequencyExt on num {
  FrequencyValues asFrequency(Frequency frequency) => FrequencyValues(
        from: frequency,
        number: this,
      );
}
