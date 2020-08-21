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

// area

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Area {
  squareKilometre,
  squareMetre,
  squareMile,
  squareYard,
  squareFoot,
  squareInch,
  hectare,
  acre
}

double convertArea(Area from, Area to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Area.squareMetre) {
    switch (to) {
      case Area.squareKilometre:
        return value / 1e+6;
      case Area.squareMile:
        return value / 2.59e+6;
      case Area.squareYard:
        return value * 1.196;
      case Area.squareFoot:
        return value * 10.764;
      case Area.squareInch:
        return value * 1550;
      case Area.hectare:
        return value / 10000;
      case Area.acre:
        return value / 4047;
      default:
        return value;
    }
  } else {
    final squareMetre = Area.squareMetre;
    switch (from) {
      case Area.squareKilometre:
        return convertArea(squareMetre, to, value * 1e+6);
      case Area.squareMile:
        return convertArea(squareMetre, to, value * 2.59e+6);
      case Area.squareYard:
        return convertArea(squareMetre, to, value / 1.196);
      case Area.squareFoot:
        return convertArea(squareMetre, to, value / 10.764);
      case Area.squareInch:
        return convertArea(squareMetre, to, value / 1550);
      case Area.hectare:
        return convertArea(squareMetre, to, value * 10000);
      case Area.acre:
        return convertArea(squareMetre, to, value * 4047);
      default:
        return value;
    }
  }
}

class AreaValues {
  final Area from;
  num number;

  AreaValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Area to) => convertArea(from, to, number);

  double get toSquareKilometre => to(Area.squareKilometre);
  double get toSquareMetre => to(Area.squareMetre);
  double get toSquareMile => to(Area.squareMile);
  double get toSquareYard => to(Area.squareYard);
  double get toSquareFoot => to(Area.squareFoot);
  double get toSquareInch => to(Area.squareInch);
  double get toHectare => to(Area.hectare);
  double get toAcre => to(Area.acre);
}

extension AreaExt on num {
  AreaValues asArea(Area area) => AreaValues(
        from: area,
        number: this,
      );
}
