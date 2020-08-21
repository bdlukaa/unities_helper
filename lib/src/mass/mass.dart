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

// mass

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Mass {
  tonne,
  gram,
  kilogram,
  milligram,
  microgram,
  imperialTon,
  usTon,
  stone,
  pound,
  ounce,
}

double convertMass(Mass from, Mass to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Mass.gram) {
    switch (to) {
      case Mass.tonne:
        return value / 1e+9;
      case Mass.kilogram:
        return value / 1000;
      case Mass.milligram:
        return value * 1000;
      case Mass.microgram:
        return value * 1e+6;
      case Mass.imperialTon:
        return value / 1.016e+6;
      case Mass.usTon:
        return value / 907185;
      case Mass.stone:
        return value / 6350;
      case Mass.pound:
        return value / 454;
      case Mass.ounce:
        return value / 28.35;
      default:
        return value;
    }
  } else {
    final gram = Mass.gram;
    switch (from) {
      case Mass.tonne:
        return convertMass(gram, to, value * 1e+9);
      case Mass.kilogram:
        return convertMass(gram, to, value * 1000);
      case Mass.milligram:
        return convertMass(gram, to, value / 1000);
      case Mass.microgram:
        return convertMass(gram, to, value / 1e+6);
      case Mass.imperialTon:
        return convertMass(gram, to, value * 1.016e+6);
      case Mass.usTon:
        return convertMass(gram, to, value * 907185);
      case Mass.stone:
        return convertMass(gram, to, value * 6350);
      case Mass.pound:
        return convertMass(gram, to, value * 454);
      case Mass.ounce:
        return convertMass(gram, to, value * 28.35);
      default:
        return value;
    }
  }
}

class MassValues {
  final Mass from;
  num number;

  MassValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Mass to) => convertMass(from, to, number);

  double get toTonne => to(Mass.tonne);
  double get toGram => to(Mass.gram);
  double get toKilogram => to(Mass.kilogram);
  double get toMilligram => to(Mass.milligram);
  double get toMicrogram => to(Mass.microgram);
  double get toImperialTon => to(Mass.imperialTon);
  double get toUSTon => to(Mass.usTon);
  double get toStone => to(Mass.stone);
  double get toPound => to(Mass.pound);
  double get toOunce => to(Mass.ounce);
}

extension MassExt on num {
  MassValues asArea(Mass mass) => MassValues(
        from: mass,
        number: this,
      );
}
