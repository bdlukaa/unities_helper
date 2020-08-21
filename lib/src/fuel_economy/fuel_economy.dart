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

// fuel consumption / economy

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum FuelEconomy {
  kilometerPerLitre,
  literPer100Kilometres,
  milePerUsGallon,
  milePerImperialGallon
}

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertFuelEconomy(
  FuelEconomy from,
  FuelEconomy to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == FuelEconomy.kilometerPerLitre) {
    switch (to) {
      case FuelEconomy.literPer100Kilometres:
        return value * 100;
      case FuelEconomy.milePerUsGallon:
        return value * 2.352;
      case FuelEconomy.milePerImperialGallon:
        return value * 2.825;
      default:
        return value;
    }
  } else {
    // always convert to liter per liter
    // to convert to the needed value
    // may lost a few decimals in the proccess
    final litre = FuelEconomy.kilometerPerLitre;
    switch (from) {
      case FuelEconomy.literPer100Kilometres:
        return convertFuelEconomy(litre, to, value / 100);
      case FuelEconomy.milePerUsGallon:
        return convertFuelEconomy(litre, to, value / 2.352);
      case FuelEconomy.milePerImperialGallon:
        return convertFuelEconomy(litre, to, value / 2.825);
      default:
        return value;
    }
  }
}

class FuelEconomyValues {
  final FuelEconomy from;
  num number;

  FuelEconomyValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(FuelEconomy to) => convertFuelEconomy(from, to, number);

  double get toKilometerPerLitre => to(FuelEconomy.kilometerPerLitre);
  double get toLiterPer100Kilometres => to(FuelEconomy.literPer100Kilometres);
  double get toMilePerUsGallon => to(FuelEconomy.milePerUsGallon);
  double get toMilePerImperialGallon => to(FuelEconomy.milePerImperialGallon);
}

extension FuelEconomyExt on num {
  FuelEconomyValues asArea(FuelEconomy fuel) => FuelEconomyValues(
        from: fuel,
        number: this,
      );
}
