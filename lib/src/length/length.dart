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

// Length

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Length {
  nanometer,
  micrometer,
  millimeter,
  centimeter,
  meter,
  kilometer,
  inch,
  mile,
  yard,
  feet,
  nautical_mile,
}

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertLength(Length from, Length to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Length.meter) {
    switch (to) {
      case Length.centimeter:
        return value * 100;
      case Length.kilometer:
        return value / 1000;
      case Length.millimeter:
        return value * 1000;
      case Length.micrometer:
        return value * 1e+6;
      case Length.nanometer:
        return value * 1e+9; // approach
      case Length.mile:
        return value / 1609; // approach
      case Length.yard:
        return value * 1.094; // approach
      case Length.feet:
        return value * 3.281; // approach
      case Length.inch:
        return value * 39.37;
      case Length.nautical_mile:
        return value / 1852;
      case Length.meter:
        return value;
      default:
        return value;
    }
  } else {
    switch (from) {
      case Length.centimeter:
        return convertLength(Length.meter, to, value * 100);
      case Length.kilometer:
        return convertLength(Length.meter, to, value * 1000);
      case Length.millimeter:
        return convertLength(Length.meter, to, value / 1000);
      case Length.micrometer:
        return convertLength(Length.meter, to, value / 1e+6);
      case Length.nanometer:
        return convertLength(Length.meter, to, value / 1e+9); // approach
      case Length.mile:
        return convertLength(Length.meter, to, value * 1609); // approach
      case Length.yard:
        return convertLength(Length.meter, to, value / 1.094); // approach
      case Length.feet:
        return convertLength(Length.meter, to, value / 3.281); // approach
      case Length.inch:
        return convertLength(Length.meter, to, value / 39.37);
      case Length.nautical_mile:
        return convertLength(Length.meter, to, value * 1852);
      default:
        return value;
    }
  }
}


class LengthValues {
  final Length from;
  num number;

  LengthValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Length to) => convertLength(from, to, number);

  double get toNanometer => to(Length.nanometer);
  double get toMicrometer => to(Length.micrometer);
  double get toMillimeter => to(Length.millimeter);
  double get toCentimeter => to(Length.centimeter);
  double get toMeter => to(Length.meter);
  double get toKilometer => to(Length.kilometer);
  double get toInch => to(Length.inch);
  double get toMile => to(Length.mile);
  double get toYard => to(Length.yard);
  double get toFeet => to(Length.feet);
  double get toNauticalMile => to(Length.nautical_mile);

}

extension LengthExt on num {
  LengthValues asLength(Length l) => LengthValues(
        from: l,
        number: this,
      );
}
