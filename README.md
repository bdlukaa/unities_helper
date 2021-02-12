A library to help Dart developers to convert unities and a few other things.

<p align="center" >
  <a title="Pub" href="https://pub.dartlang.org/packages/unities_helper" >
    <img src="https://img.shields.io/pub/v/unities_helper.svg?style=popout&include_prereleases" />
  </a>
  <a title="Github License">
    <img src="https://img.shields.io/github/license/bdlukaa/color-picker" />
  </a>
  <a title="PRs are welcome">
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" />
  </a>
  <a title="Discord" href="https://discord.gg/674gpDQUVq">
    <img src="https://img.shields.io/discord/809528329337962516?label=discord&logo=discord" />
  </a>
<div>

## Usage

A simple usage example:

```dart
import 'package:unities_helper/unities_helper.dart';

main() {
  /// Convert 25°C into Fahrenheit
  final temperature = convert<Temperature>(
    Temperature.celcius, // from
    Temperature.fahrenheit, // to
    25, // value
  );
  print(temperature);
}
```

A more detailed example can be found on the example folder

## Supported conversions

- [Area](#area)
- [Color spaces](#color-spaces)
- [Data transfer rate](#data-transfer-rate)
- [Digital storage](#digital-storage)
- [Energy](#energy)
- [Frequency](#frequency)
- [Fuel Economy](#fuel-economy)
- [Length](#length)
- [Mass](#mass)
- [Plane angle](#plane-angle)
- [Pressure](#pressure)
- [Speed](#speed)
- [Temperature](#temperature)
- [Time](#time)
- [Volume](#volume)

### Area

|                        |                   |                   |
| ---------------------- | ----------------- | ----------------- |
| Square Kilometre (km²) | Square metre (m²) | Square mile (mi²) |
| Square yard            | Square foot       | Square inch (in²) |
| Hectare                | Acre              |                   |

```dart
main() {
  final area = convertArea(
    Area.squareMetre, // from
    Area.squareKilometre, // to
    10000000, // value
  );
  print(area); // 10
}
```

### Color spaces

|     |     |      |     |
| --- | --- | ---- | --- |
| HEX | HSV | HSLA | RGB |

```dart
main() {
  final hex = RGBColor(red: 255, green: 255, blue: 255).toHex;
  print(hex);
}
```

### Data Transfer Rate

| bit | kilo     | mega     | giga     | tera     |
| --- | -------- | -------- | -------- | -------- |
|     | kibibit  | mebibit  | gibibit  | tebibit  |
| bit | kilobit  | megabit  | gigabit  | terabit  |
|     | kilobyte | megabyte | gigabyte | terabyte |

```dart
main() {
  final rate = convertDataTransferRate(
    DataTransferRate.gigabyte, // from
    DataTransferRate.megabyte, // to
    1, // value
  );
  print(rate); // 1000
}
```

### Digital storage

| bit  | kilo     | mega     | giga     | tera     | peta     |
| ---- | -------- | -------- | -------- | -------- | -------- |
| bit  | kilobit  | megabit  | gigabit  | terabit  | petabit  |
| byte | kibibit  | mebibit  | gibibit  | tebibit  | pebibit  |
|      | kilobyte | megabyte | gigabyte | terabyte | petabyte |
|      | kibibyte | mebibyte | gibibyte | tebibyte | pebibyte |

```dart
main() {
  final storage = convertDigitalStorage(
    DigitalStorage.gigabyte, // from
    DigitalStorage.megabyte, // to
    1, // value
  );
  print(storage); // 1000
}
```

### Energy

|                     |            |               |
| ------------------- | ---------- | ------------- |
| Joule               | Kilojoule  | Gram calorie  |
| Kilocalorie         | Watt-hour  | Kilowatt-hour |
| electron-volt       | therm (US) | Foot-pound    |
| British Termal Unit |            |               |

```dart
main() {
  final energy = convertEnergy(
    Energy.kilocalorie, // from
    Energy.gramCalorie, // to
    1, // value
  );
  print(energy); // 1000
}
```

### Frequency

|            |                 |                 |                 |
| ---------- | --------------- | --------------- | --------------- |
| Hertz (Hz) | Kilohertz (kHz) | Megahertz (mHz) | Gigahertz (gHz) |

```dart
main() {
  final frequency = convertEnergy(
    Frequency.megahertz, // from
    Frequency.hertz, // to
    1, // value
  );
  print(frequency); // 1000000
}
```

### Fuel Economy

|                     |                          |
| ------------------- | ------------------------ |
| Kilometer per litre | Liter per 100 kilometres |
| Mile per US Gallon  | Mile per Imperial Gallon |

```dart
main() {
  final fuel = convertFuelEconomy(
    FuelEconomy.kilometerPerLitre, // from
    FuelEconomy.milePerUsGallon, // to
    1, // value
  );
  print(fuel); // 2,35215
}
```

### Length

|           |            |               |            |
| --------- | ---------- | ------------- | ---------- |
| Nanometer | Micrometer | Millimeter    | Centimeter |
| Meter     | Kilometer  | Inch          | Mile       |
| Yard      | Feet       | Nautical Mile |            |

```dart
main() {
  final length = convertLength(
    Length.centimeter, // from
    Length.meter, // to
    100, // value
  );
  print(length); // 1
}
```

### Mass

|           |              |          |           |
| --------- | ------------ | -------- | --------- |
| Tonne     | Gram         | Kilogram | Milligram |
| Microgram | Imperial Ton | US ton   | Stone     |
| Pound     | Ounce        |          |           |

```dart
main() {
  final mass = convertMass(
    Mass.kilogram, // from
    Mass.gram, // to
    1, // value
  );
  print(mass); // 1000
}
```

### Plane Angle°

|               |               |             |        |
| ------------- | ------------- | ----------- | ------ |
| Degree        | Gradian       | Milliradian | Radian |
| Minute of arc | Second of arc |             |        |

```dart
main() {
  final angle = convertPlaneAngle(
    PlaneAngle.degree, // from
    PlaneAngle.minuteOfArc, // to
    1, // value
  );
  print(angle); // 60
}
```

### Pressure

|                  |        |      |                     |
| ---------------- | ------ | ---- | ------------------- |
| Bar              | Pascal | Torr | Standart Atmosphere |
| Pounc-force \in² |        |      |                     |

\in² = per square-inch

```dart
main() {
  final pressure = convertPressure(
    Pressure.bar, // from
    Pressure.pascal, // to
    1, // value
  );
  print(pressure); // 100000
}
```

### Speed

|         |        |         |             |      |
| ------- | ------ | ------- | ----------- | ---- |
| Miles/h | Foot/s | Metre/s | Kilemetre/h | Knot |

```dart
main() {
  final speed = convertSpeed(
    Speed.metrePerSecond, // from
    Speed.kilometrePerHour, // to
    1, // value
  );
  print(speed); // 3.6
}
```

### Temperature

|         |            |        |
| ------- | ---------- | ------ |
| Celcius | Fahrenheit | Kelvin |

```dart
main() {
  final temperature = convertTemperature(
    Temperature.celcius, // from
    Temperature.fahrenheit, // to
    0, // value
  );
  print(temperature); // 32
}
```

### Time

|            |           |             |        |        |
| ---------- | --------- | ----------- | ------ | ------ |
| Nanosecond | microsend | millisecond | second | minute |
| hour       | day       | week        | month  | year   |
| decade     | centure   | millenium   |        |        |

```dart
main() {
  final time = convertTime(
    Time.minute, // from
    Time.second, // to
    1, // value
  );
  print(temperature); // 60
}
```

### Volume

|               |              |             |
| ------------- | ------------ | ----------- |
| Liquid Gallon | Liquid Quart | Liquid Pint |
| Cup           | Fluid Ounce  | Tablespoon  |
| Teaspoon      | Cubic Metre  | Litre       |
| Millilitre    | Gallon       | Cubic Foot  |
| Cubic Inch    |              |             |

```dart
main() {
  final volume = convertVolume(
    Volume.litre, // from
    Volume.millilitre, // to
    1, // value
  );
  print(volume); // 1000
}
```

## Using extension methods

Instead of using `convert + unit name`, you can use `num.as + unit name`. For example, if I want to convert mass, I can do it with two ways:

### Using convert method

```dart
main() {
  final mass = convertMass(Mass.kilogram, Mass.gram, 10);
  print(mass);
}
```

### Using extension methods

```dart
main() {
  final mass = 10.asMass(Mass.kilogram).toGram;
  print(mass);
}
```

Both will print the same results. You can use extension methods with the following conversion types:

- ✔️ Area
- ❌ Color
- ✔️ Data Transfer Rate
- ✔️ Digital Storage
- ✔️ Energy
- ✔️ Frequency
- ✔️ Fuel Economy
- ✔️ Length
- ✔️ Mass
- ✔️ Plane Angle
- ✔️ Pressure
- ✔️ Speed
- ✔️ Temperature
- ✔️ Time
- ✔️ Volume

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/bdlukaa/unities_helper/issues).
