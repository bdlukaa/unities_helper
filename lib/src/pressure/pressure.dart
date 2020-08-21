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

// pressure

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Pressure {
  bar,
  pascal,
  torr,
  pound_forcePerSquareInch,
  standartAtmosphere
}

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertPressure(Pressure from, Pressure to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Pressure.pascal) {
    switch (to) {
      case Pressure.bar:
        return value / 100000;
      case Pressure.pound_forcePerSquareInch:
        return value / 6895; // approximate
      case Pressure.standartAtmosphere:
        return value / 101325;
      case Pressure.torr:
        return value / 133;
      default:
        return value;
    }
  } else {
    final pascal = Pressure.pascal;
    switch (from) {
      case Pressure.bar:
        return convertPressure(pascal, to, value * 100000);
      case Pressure.pound_forcePerSquareInch:
        return convertPressure(pascal, to, value * 6895);
      case Pressure.standartAtmosphere:
        return convertPressure(pascal, to, value * 101325);
      case Pressure.torr:
        return convertPressure(pascal, to, value * 133);
      default:
        return value;
    }
  }
}

class PressureValues {
  final Pressure from;
  num number;

  PressureValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Pressure to) => convertPressure(from, to, number);

  double get toBar => to(Pressure.bar);
  double get toPascal => to(Pressure.pascal);
  double get toTorr => to(Pressure.torr);
  double get toPoundForcePerSquareInch => to(Pressure.pound_forcePerSquareInch);
  double get toStandartAtmosphere => to(Pressure.standartAtmosphere);

}

extension PressureExt on num {
  PressureValues asPressure(Pressure p) => PressureValues(
        from: p,
        number: this,
      );
}
