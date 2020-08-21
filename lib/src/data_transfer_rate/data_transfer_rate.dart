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

// data transfer rate

import '../unities_helper_base.dart' show verify;

/// Data tranfer rate per second
/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
enum DataTransferRate {
  bit,
  kilobit,
  kilobyte,
  kibibit,
  megabit,
  megabyte,
  mebibit,
  gigabit,
  gigabyte,
  gibibit,
  terabit,
  terabyte,
  tebibit,
}

/// Data tranfer rate per second
/// Approximate result when converting.
/// Some decimals may be lost in the proccess.
double convertDataTransferRate(
  DataTransferRate from,
  DataTransferRate to,
  double value,
) {
  verify(from, to, value);
  if (from == to) return value;
  if (from == DataTransferRate.bit) {
    switch (to) {
      case DataTransferRate.kilobit:
        return value / 1000;
      case DataTransferRate.kilobyte:
        return value / 8000;
      case DataTransferRate.kibibit:
        return value / 1024;
      case DataTransferRate.megabit:
        return value / 1e+6;
      case DataTransferRate.megabyte:
        return value / 8e+6;
      case DataTransferRate.mebibit:
        return value / 1.049e+6;
      case DataTransferRate.gigabit:
        return value / 1e+9;
      case DataTransferRate.gigabyte:
        return value / 8e+9;
      case DataTransferRate.gibibit:
        return value / 1.074e+9;
      case DataTransferRate.terabit:
        return value / 1e+12;
      case DataTransferRate.terabyte:
        return value / 8e+12;
      case DataTransferRate.tebibit:
        return value / 1.1e+12;
      default:
        return value;
    }
  } else {
    final bit = DataTransferRate.bit;
    switch (from) {
      case DataTransferRate.kilobit:
        return convertDataTransferRate(bit, to, value * 1000);
      case DataTransferRate.kilobyte:
        return convertDataTransferRate(bit, to, value * 8000);
      case DataTransferRate.kibibit:
        return convertDataTransferRate(bit, to, value * 1024);
      case DataTransferRate.megabit:
        return convertDataTransferRate(bit, to, value * 1e+6);
      case DataTransferRate.megabyte:
        return convertDataTransferRate(bit, to, value * 8e+6);
      case DataTransferRate.mebibit:
        return convertDataTransferRate(bit, to, value * 1.049e+6);
      case DataTransferRate.gigabit:
        return convertDataTransferRate(bit, to, value * 1e+9);
      case DataTransferRate.gigabyte:
        return convertDataTransferRate(bit, to, value * 8e+9);
      case DataTransferRate.gibibit:
        return convertDataTransferRate(bit, to, value * 1.074e+9);
      case DataTransferRate.terabit:
        return convertDataTransferRate(bit, to, value * 1e+12);
      case DataTransferRate.terabyte:
        return convertDataTransferRate(bit, to, value * 8e+12);
      case DataTransferRate.tebibit:
        return convertDataTransferRate(bit, to, value * 1.1e+12);
      default:
        return value;
    }
  }
}

class DataTransferRateValues {
  final DataTransferRate from;
  num number;

  DataTransferRateValues({
    this.from,
    this.number,
  })  : assert(from != null),
        assert(number != null);

  double to(DataTransferRate to) => convertDataTransferRate(from, to, number);

  double get toBit => to(DataTransferRate.bit);
  double get toKilobit => to(DataTransferRate.kilobit);
  double get toKilobyte => to(DataTransferRate.kilobyte);
  double get toKibibit => to(DataTransferRate.kibibit);
  double get toMegabit => to(DataTransferRate.megabit);
  double get toMegabyte => to(DataTransferRate.megabyte);
  double get toMebibit => to(DataTransferRate.mebibit);
  double get toGigabit => to(DataTransferRate.gigabit);
  double get toGigabyte => to(DataTransferRate.gigabyte);
  double get toGibibit => to(DataTransferRate.gibibit);
  double get toTerabit => to(DataTransferRate.terabit);
  double get toTerabyte => to(DataTransferRate.terabyte);
  double get toTebibit => to(DataTransferRate.tebibit);

}

extension DataTransferRateExt on num {
  DataTransferRateValues asDataTransferRate(DataTransferRate data) => DataTransferRateValues(
        from: data,
        number: this,
      );
}
