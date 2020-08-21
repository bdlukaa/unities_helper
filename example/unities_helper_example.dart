import 'package:unities_helper/unities_helper.dart';

void main() {
  final temperature = convert<Temperature>(
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
  final binary = convert<Binary>( 
    Binary.from, // from text
    Binary.to.withSeparator(' '), // to binary
    // to do binary to text just invert
    'Convert this to binary', // text
  ); /// Convert a text to binary
  print(binary);
}
