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

// energy

import '../unities_helper_base.dart' show verify;

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum Energy {
  joule,
  kilojoule,
  gramCalorie,
  kilocalorie,
  wattHour,
  kilowattHour,
  electronvolt,
  britishThermalUnit,
  usTherm,
  foot_pound,
}

/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertEnergy(Energy from, Energy to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Energy.joule) {
    switch (to) {
      case Energy.kilojoule:
        return value / 1000;
      case Energy.gramCalorie:
        return value / 4.184;
      case Energy.kilocalorie:
        return value / 4184;
      case Energy.wattHour:
        return value / 3600;
      case Energy.kilowattHour:
        return value / 3.6e+6;
      case Energy.electronvolt:
        return value / 6.242e+18;
      case Energy.britishThermalUnit:
        return value / 1055;
      case Energy.usTherm:
        return value / 1.055e+8;
      case Energy.foot_pound:
        return value / 1.356;
      default:
        return value;
    }
  } else {
    final joule = Energy.joule;
    switch (from) {
      case Energy.kilojoule:
        return convertEnergy(joule, to, value * 1000);
      case Energy.gramCalorie:
        return convertEnergy(joule, to, value * 4.184);
      case Energy.kilocalorie:
        return convertEnergy(joule, to, value * 4184);
      case Energy.wattHour:
        return convertEnergy(joule, to, value * 3600);
      case Energy.kilowattHour:
        return convertEnergy(joule, to, value * 3.6e+6);
      case Energy.electronvolt:
        return convertEnergy(joule, to, value * 6.242e+18);
      case Energy.britishThermalUnit:
        return convertEnergy(joule, to, value * 1055);
      case Energy.usTherm:
        return convertEnergy(joule, to, value * 1.055e+8);
      case Energy.foot_pound:
        return convertEnergy(joule, to, value * 1.356);
      default:
        return value;
    }
  }
}

class EnergyValues {
  final Energy from;
  num number;

  EnergyValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Energy to) => convertEnergy(from, to, number);

  double get toJoule => to(Energy.joule);
  double get toKilojoule => to(Energy.kilojoule);
  double get toGramCalorie => to(Energy.gramCalorie);
  double get toKilocalorie => to(Energy.kilocalorie);
  double get toWatthour => to(Energy.wattHour);
  double get toKilowattHour => to(Energy.kilowattHour);
  double get toElectronVolt => to(Energy.electronvolt);
  double get toBritishThermalUnit => to(Energy.britishThermalUnit);
  double get toUStherm => to(Energy.usTherm);
  double get toFootPound => to(Energy.foot_pound);

}

extension EnergyExt on num {
  EnergyValues asEnergy(Energy energy) => EnergyValues(
        from: energy,
        number: this,
      );
}
