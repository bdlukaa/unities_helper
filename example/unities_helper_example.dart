import 'package:unities_helper/unities_helper.dart';

void main() {
  final temperature = convertTemperature(
    Temperature.celcius, // from
    Temperature.fahrenheit, // to
    25, // celcius
  ); /// Convert 25°C into Fahrenheit
  print(temperature);
  final length = convert<Length>(
    Length.centimeter, // from
    Length.meter, // to
    300, // centimeters
  ); /// Convert 300 centimeters into meter
  print(length);

  // final mass = convertMass(Mass.kilogram, Mass.gram, 10);
  final mass = 10.asMass(Mass.kilogram).toGram;
  print(mass);
}
