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

import 'package:unities_helper/src/speed/speed.dart';

import 'area/area.dart';
import 'data_transfer_rate/data_transfer_rate.dart';
import 'energy/energy.dart';
import 'frequency/frequency.dart';
import 'fuel_economy/fuel_economy.dart';
import 'length/length.dart';
import 'mass/mass.dart';
import 'plane_angle/plane_angle.dart';
import 'pressure/pressure.dart';
import 'temperature/temperature.dart';
import 'time/time.dart';
import 'volume/volume.dart';
import 'binary/binary.dart';

export 'area/area.dart';
export 'data_transfer_rate/data_transfer_rate.dart';
export 'energy/energy.dart';
export 'frequency/frequency.dart';
export 'fuel_economy/fuel_economy.dart';
export 'length/length.dart';
export 'mass/mass.dart';
export 'plane_angle/plane_angle.dart';
export 'pressure/pressure.dart';
export 'temperature/temperature.dart';
export 'time/time.dart';
export 'volume/volume.dart';
export 'binary/binary.dart';
export 'hexadecimal/hexadecimal.dart';
export 'colors/color.dart';

// This is a library to help you convert unities
// All the formulas are from google converter
// Aug 2020
// TODO: digital storage
//

/// Convert the types
///
/// Set [T] as the type you want to convert.
/// All values must not be null. [from] and [to]
/// must have the same type: [T]
///
/// Supported convertions:
///
dynamic convert<T>(T from, T to, dynamic value) {
  assert(from != null);
  assert(to != null);
  assert(value != null);
  assert(from is T);
  assert(to is T);
  assert(from.runtimeType == to.runtimeType);

  // ignore: omit_local_variable_types
  final bool Function<T>() isType = <T>() => from is T;

  if (isType<Temperature>()) {
    assert(value is num);
    return convertTemperature(
      (from as Temperature),
      (to as Temperature),
      value.toDouble(),
    );
  } else if (isType<Length>()) {
    assert(value is num);
    return convertLength(
      (from as Length),
      (to as Length),
      value.toDouble(),
    );
  } else if (isType<FuelEconomy>()) {
    assert(value is num);
    return convertFuelEconomy(
      (from as FuelEconomy),
      (to as FuelEconomy),
      value.toDouble(),
    );
  } else if (isType<Frequency>()) {
    assert(value is num);
    return convertFrequency(
      (from as Frequency),
      (to as Frequency),
      value.toDouble(),
    );
  } else if (isType<Mass>()) {
    assert(value is num);
    return convertMass(
      (from as Mass),
      (to as Mass),
      value.toDouble(),
    );
  } else if (isType<Area>()) {
    assert(value is num);
    return convertArea(
      (from as Area),
      (to as Area),
      value.toDouble(),
    );
  } else if (isType<Speed>()) {
    assert(value is num);
    return convertSpeed(
      (from as Speed),
      (to as Speed),
      value.toDouble(),
    );
  } else if (isType<Pressure>()) {
    assert(value is num);
    return convertPressure(
      (from as Pressure),
      (to as Pressure),
      value.toDouble(),
    );
  } else if (isType<Time>()) {
    assert(value is num);
    return convertTime(
      (from as Time),
      (to as Time),
      value.toDouble(),
    );
  } else if (isType<PlaneAngle>()) {
    assert(value is num);
    return convertPlaneAngle(
      (from as PlaneAngle),
      (to as PlaneAngle),
      value.toDouble(),
    );
  } else if (isType<Energy>()) {
    assert(value is num);
    return convertEnergy(
      (from as Energy),
      (to as Energy),
      value.toDouble(),
    );
  } else if (isType<DataTransferRate>()) {
    assert(value is num);
    return convertDataTransferRate(
      (from as DataTransferRate),
      (to as DataTransferRate),
      value.toDouble(),
    );
  } else if (isType<Volume>()) {
    assert(value is num);
    return convertVolume(
      (from as Volume),
      (to as Volume),
      value.toDouble(),
    );
  } else if (isType<Binary>()) {
    assert(value is String);
    if (from.runtimeType == Binary.to.runtimeType) {
      assert(to.runtimeType == Binary.from.runtimeType);
      return binaryToText(
        value.toString(),
        separator: (to as BinaryFrom).separator,
      );
    } else {
      assert(to.runtimeType == Binary.to.runtimeType);
      return textToBinary(
        value.toString(),
        separator: (to as BinaryTo).separator,
      );
    }
  }
  print(from is Binary);
  return value;
}

void verify(from, to, value) {
  assert(from != null);
  assert(to != null);
  assert(value != null);
}
