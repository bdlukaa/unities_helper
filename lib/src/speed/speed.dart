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

// speed

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Speed {
  milesPerHour,
  footPerSecond,
  metrePerSecond,
  kilometrePerHour,
  knot,
}

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertSpeed(Speed from, Speed to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Speed.kilometrePerHour) {
    switch (to) {
      case Speed.milesPerHour:
        return value / 1.609; // approximate
      case Speed.footPerSecond:
        return value / 1.097; // approximate
      case Speed.metrePerSecond:
        return value / 3.6;
      case Speed.knot:
        return value / 1.852;
      default:
        return value;
    }
  } else {
    final kilometrePerHour = Speed.kilometrePerHour;
    switch (from) {
      case Speed.milesPerHour:
        return convertSpeed(kilometrePerHour, to, value * 1.609);
      case Speed.footPerSecond:
        return convertSpeed(kilometrePerHour, to, value * 1.097);
      case Speed.metrePerSecond:
        return convertSpeed(kilometrePerHour, to, value * 3.6);
      case Speed.knot:
        return convertSpeed(kilometrePerHour, to, value * 1.852);
      default:
        return value;
    }
  }
}

class SpeedValues {
  final Speed from;
  num number;

  SpeedValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Speed to) => convertSpeed(from, to, number);

  double get toMilesPerHour => to(Speed.milesPerHour);
  double get toKilometresPerHour => to(Speed.kilometrePerHour);
  double get toFeetPerSecond => to(Speed.footPerSecond);
  double get toMetresPerSecond => to(Speed.metrePerSecond);
  double get toKnot => to(Speed.knot);

}

extension SpeedExt on num {
  SpeedValues asSpeed(Speed s) => SpeedValues(
        from: s,
        number: this,
      );
}
