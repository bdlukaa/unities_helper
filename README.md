A library to help Dart developers to convert unities and a few other things.

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

## Supported conversions:

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

### Color codes

|     |     |      |     |
| --- | --- | ---- | --- |
| HEX | HSV | HSLA | RGB |

### Data Transfer Rate

| bit  | kilo     | mega     | giga     | tera     |
| ---- | -------- | -------- | -------- | -------- |
|      | kibibit  | mebibit  | gibibit  | tebibit  |
| bit  | kilobit  | megabit  | gigabit  | terabit  |
| byte | kilobyte | megabyte | gigabyte | terabyte |

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

|       |           |           |           |
| ----- | --------- | --------- | --------- |
| Hertz | Kilohertz | Megahertz | Gigahertz |

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

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/bdlukaa/unities_helper/issues
