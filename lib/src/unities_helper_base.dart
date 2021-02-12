// This is a library to help you convert unities

import 'area/area.dart';
import 'data_transfer_rate/data_transfer_rate.dart';
import 'digital_storage/digital_storage.dart';
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
import 'speed/speed.dart';

export 'area/area.dart';
export 'data_transfer_rate/data_transfer_rate.dart';
export 'digital_storage/digital_storage.dart';
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
export 'colors/color.dart';

/// Convert the types
///
/// Set `T` the type you want to convert.
/// All values must not be null. `from` and `to`
/// must have the same type: `T`
///
/// Basic usage:
/// ```dart
/// main() {
///  // Convert 25°C into Fahrenheit
///  final temperature = convert<Temperature>(
///    Temperature.celcius, // from
///    Temperature.fahrenheit, // to
///    25, // value
///  );
///  print(temperature);
///}
///```
///
/// Supported convertions:
///
/// - ✔️ Area
/// - ✔️ Data Transfer Rate
/// - ✔️ Energy
/// - ✔️ Frequency
/// - ✔️ Fuel Economy
/// - ✔️ Length
/// - ✔️ Mass
/// - ✔️ Plane Angle
/// - ✔️ Pressure
/// - ✔️ Speed
/// - ✔️ Temperature
/// - ✔️ Time
/// - ✔️ Volume
/// - ❌ Colors
///
/// Useful links:
///   - https://github.com/bdlukaa/unities_helper#usage
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
  } else if (isType<DigitalStorage>()) {
    assert(value is num);
    return convertDigitalStorage(
      (from as DigitalStorage),
      (to as DigitalStorage),
      value.toDouble(),
    );
  } else {
    throw UnsupportedError('Type $T is not a supported convertion type');
  }
  // return value;
}

/// Make sure `from`, `to` and `value` are not null
void verify(from, to, value) {
  assert(from != null);
  assert(to != null);
  assert(value != null);
}
