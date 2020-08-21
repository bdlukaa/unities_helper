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

// plane angle

import 'dart:math';

import '../unities_helper_base.dart' show verify;

enum PlaneAngle {
  degree,
  gradian,
  milliradian,
  radian,
  minuteOfArc,
  secondOfArc,
}

double convertPlaneAngle(PlaneAngle from, PlaneAngle to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == PlaneAngle.degree) {
    switch (to) {
      case PlaneAngle.gradian:
        return value * 200 / 180;
      case PlaneAngle.milliradian:
        return value * (1000 * pi) / 180;
      case PlaneAngle.radian:
        return value * 60;
      case PlaneAngle.minuteOfArc:
        return value * (pi / 180);
      case PlaneAngle.secondOfArc:
        return value * 3600;
      default:
        return value;
    }
  } else {
    final degree = PlaneAngle.degree;
    switch (from) {
      case PlaneAngle.gradian:
        return convertPlaneAngle(degree, to, value * 200 / 180);
      case PlaneAngle.milliradian:
        return convertPlaneAngle(degree, to, value * (1000 * pi) / 180);
      case PlaneAngle.radian:
        return convertPlaneAngle(degree, to, value * 60);
      case PlaneAngle.minuteOfArc:
        return convertPlaneAngle(degree, to, value * (pi / 180));
      case PlaneAngle.secondOfArc:
        return convertPlaneAngle(degree, to, value * 3600);
      default:
        return value;
    }
  }
}

class PlaneAngleValues {
  final PlaneAngle from;
  num number;

  PlaneAngleValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(PlaneAngle to) => convertPlaneAngle(from, to, number);

  double get toDegree => to(PlaneAngle.degree);
  double get toGradian => to(PlaneAngle.gradian);
  double get toMilliradian => to(PlaneAngle.milliradian);
  double get toRadian => to(PlaneAngle.radian);
  double get toMinuteOfArc => to(PlaneAngle.minuteOfArc);
  double get toSecondOfArc => to(PlaneAngle.secondOfArc);
}

extension PlaneAngleExt on num {
  PlaneAngleValues asPlaneAngle(PlaneAngle angle) => PlaneAngleValues(
        from: angle,
        number: this,
      );
}
