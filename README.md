A library to help Dart developers to convert unities and a few other things.

## Usage

A simple usage example:

```dart
import 'package:unities_helper/unities_helper.dart';

main() {
  final temperature = convert<Temperature>(
    Temperature.celcius, // from
    Temperature.fahrenheit, // to
    25, // value
  ); /// Convert 25°C into Fahrenheit
  print(temperature);
}
```

A more detailed example can be found on the example folder

## Supported conversions:

1. Area: square kilometre, square metre square mile, square yard, square foot, square inch, hectare and acre
2. Binary (Not full support yet): text to binary and binary to text
3. Color codes: HEX, HSV, HSLA, RGBA
4. Data trasnfer rate: bit, kilobit, kilobyte, kibibit, megabit, megabyte, mebibit, gigabit, gigabyte, gibibit, terabit, terabyte and tebibit
5. Energy: joule, kilojoule, gram calorie, kilocalorie, watt-hour, kilowatt-hour, electron-volt, british thermal unit, therm (US) and foot-pound
6. Frequency: hertz, kilohertz, megahertz and gigahertz
7. Fuel economy: kilometer per litre, liter per 100 kilometres, mile per US gallon and mile per imperial gallon
8. Hexadecimal (Not full support yet): text to hex and hex to text
9. Keyboard conversion (Not implemented yet): latin, hangul / hanja (korean), kanji / hiragana / katakana / romaji (japanese), chinese...
10. Length: nanometer, micrometer, millimeter, centimeter, meter, kilometer, inch, mile, yard, feet and nautical mile
11. tonne, gram, kilogram, milligram, microgram, imperial ton, us ton, stone, pound and ounce
12. Plane angle: degree, gradian, milliradian, radian, minute of arc and second of arc
13. Pressure: bar, pascal, torr, pound-force per  square inch and standart atmosphere
14. miles per hour, foot per second, metre per second, kilometre per hour and knot
15. Temperature: celcius, fahrenheit, kelvin
16. Time: nanosecond, microsecond, millisecond, second, minute, hour, day, week, month, calendar year, decade and century
17. Volume: usLiquidGallon, usLiquidQuart, usLiquidPint, usLegalCup, usFluidOunce, usTablespoon, usTeaspoon, cubicMetre, litre, millilitre, gallon, imperialQuart, imperialPint, imperialCup, fluidOunce, imperialTablespoon, imperialTeaspoon, cubicFoot, cubicInch,

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/bdlukaa/unities_helper/issues
