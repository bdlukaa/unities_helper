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

import '../unities_helper_base.dart';

// volume

enum Volume {
  usLiquidGallon,
  usLiquidQuart,
  usLiquidPint,
  usLegalCup,
  usFluidOunce,
  usTablespoon,
  usTeaspoon,
  cubicMetre,
  litre,
  millilitre,
  gallon,
  imperialQuart,
  imperialPint,
  imperialCup,
  fluidOunce,
  imperialTablespoon,
  imperialTeaspoon,
  cubicFoot,
  cubicInch,
}

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertVolume(
  Volume from,
  Volume to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Volume.litre) {
    switch (to) {
      case Volume.usLiquidGallon:
        return value / 3.785;
      case Volume.usLiquidQuart:
        return value / 1.057;
      case Volume.usLiquidPint:
        return value * 2.113;
      case Volume.usLegalCup:
        return value * 4.167;
      case Volume.usFluidOunce:
        return value * 33.814;
      case Volume.usTablespoon:
        return value * 67.628;
      case Volume.usTeaspoon:
        return value * 203;
      case Volume.millilitre:
        return value * 1000;
      case Volume.gallon:
        return value / 4.546;
      case Volume.cubicFoot:
        return value / 28.317;
      case Volume.cubicInch:
        return value * 61.024;
      case Volume.imperialQuart:
        return value / 1.137;
      case Volume.imperialPint:
        return value * 1.76;
      case Volume.imperialCup:
        return value * 3.52;
      case Volume.fluidOunce:
        return value * 35.195;
      case Volume.imperialTablespoon:
        return value * 56.312;
      case Volume.imperialTeaspoon:
        return value * 169;
      default:
        return value;
    }
  } else {
    final litre = Volume.litre;
    switch (from) {
      case Volume.usLiquidGallon:
        return convertVolume(litre, to, value * 3.785);
      case Volume.usLiquidQuart:
        return convertVolume(litre, to, value * 1.057);
      case Volume.usLiquidPint:
        return convertVolume(litre, to, value / 2.113);
      case Volume.usLegalCup:
        return convertVolume(litre, to, value / 4.167);
      case Volume.usFluidOunce:
        return convertVolume(litre, to, value / 33.814);
      case Volume.usTablespoon:
        return convertVolume(litre, to, value / 67.628);
      case Volume.usTeaspoon:
        return convertVolume(litre, to, value / 203);
      case Volume.millilitre:
        return convertVolume(litre, to, value / 1000);
      case Volume.gallon:
        return convertVolume(litre, to, value * 4.546);
      case Volume.cubicFoot:
        return convertVolume(litre, to, value * 28.317);
      case Volume.cubicInch:
        return convertVolume(litre, to, value / 61.024);
      case Volume.imperialQuart:
        return convertVolume(litre, to, value * 1.137);
      case Volume.imperialPint:
        return convertVolume(litre, to, value / 1.76);
      case Volume.imperialCup:
        return convertVolume(litre, to, value / 3.52);
      case Volume.fluidOunce:
        return convertVolume(litre, to, value / 35.195);
      case Volume.imperialTablespoon:
        return convertVolume(litre, to, value / 56.312);
      case Volume.imperialTeaspoon:
        return convertVolume(litre, to, value / 169);
      default:
        return value;
    }
  }
}

class VolumeValues {
  Volume from;
  num number;

  VolumeValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Volume to) => convertVolume(from, to, number);

  // TODO: premade to
}

extension VolumeExt on num {
  VolumeValues asVolume(Volume v) => VolumeValues(
        from: v,
        number: this,
      );
}
