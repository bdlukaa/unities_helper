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

// Temperature

import '../unities_helper_base.dart' show verify;

enum Temperature { celcius, fahrenheit, kelvin }

double convertTemperature(Temperature from, Temperature to, double value) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == Temperature.celcius) {
    if (to == Temperature.fahrenheit) return (value * 9 / 5) + 32;
    if (to == Temperature.kelvin) return value + 273.15;
  } else if (from == Temperature.fahrenheit) {
    if (to == Temperature.celcius) return (value - 32) * 5 / 9;
    if (to == Temperature.kelvin) return (value - 32) * 5 / 9 + 273.15;
  } else if (from == Temperature.kelvin) {
    if (to == Temperature.celcius) return value - 273.15;
    if (to == Temperature.fahrenheit) return (value - 273.15) * 9 / 5 + 32;
  }
  return value;
}

class TemperatureValues {
  final Temperature from;
  num number;

  TemperatureValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(Temperature to) => convertTemperature(from, to, number);

  double get toFahrenheit => to(Temperature.fahrenheit);
  double get toCelcius => to(Temperature.celcius);
  double get toKelvin => to(Temperature.kelvin);
}

extension TempExt on num {
  TemperatureValues asTemperature(Temperature temp) => TemperatureValues(
        from: temp,
        number: this,
      );
}
