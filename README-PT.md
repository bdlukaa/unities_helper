A library to help Dart developers to convert unities and a few other things.

<p align="center">
  <a title="Me compre um café" href="https://www.buymeacoffee.com/bdlukaa">
    <img src="https://img.buymeacoffee.com/button-api/?text=Me compre um café&emoji=&slug=bdlukaa&button_colour=FF5F5F&font_colour=ffffff&font_family=Lato&outline_colour=000000&coffee_colour=FFDD00">
  </a>
</p>
<p align="center" >
  <a title="Pub" href="https://pub.dartlang.org/packages/unities_helper" >
    <img src="https://img.shields.io/pub/v/unities_helper.svg?style=popout&include_prereleases" />
  </a>
  <a title="Licença">
    <img src="https://img.shields.io/github/license/bdlukaa/color-picker" />
  </a>
  <a title="PRs são bem-vindos">
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" />
  </a>
  <a title="Discord" href="https://discord.gg/674gpDQUVq">
    <img src="https://img.shields.io/discord/809528329337962516?label=discord&logo=discord" />
  </a>
<p>

[English](README.md) | Português

## Uso

Um simples exemplo de como usar:

```dart
import 'package:unities_helper/unities_helper.dart';

main() {
  /// Converter 25°C em Fahrenheit
  final temperatura = convert<Temperature>(
    Temperature.celcius, // de
    Temperature.fahrenheit, // para
    25, // valor
  );
  print(temperatura);
}
```

Um exemplo mais detalhado pode ser encontrado na pasta [example](example/)

## Conversões suportadas

- [Área](#área)
- [Intervalos de cores](#intervalos-de-cores)
- [Transmissão de dados](#transmissão-de-dados)
- [Armazenamento de dados](#armazenamento-de-dados)
- [Energia](#energia)
- [Frequência](#frequência)
- [Consumo de combustível](#consumo-de-combustível)
- [Comprimento](#comprimento)
- [Massa](#massa)
- [Ângulo](#ângulo)
- [Pressão](#pressão)
- [Velocidade](#velocidade)
- [Temperatura](#temperatura)
- [Tempo](#tempo)
- [Volume](#volume)

### Área

|                |                       |                         |
| -------------- | --------------------- | ----------------------- |
| km²            | m²                    | Milha quadrada (mi²)    |
| Jarda quadrada | Pé quadrado           | Polegada quadrada (in²) |
| Hectare        | Acre (medida agrária) |                         |

```dart
main() {
  final area = convertArea(
    Area.squareMetre, // de
    Area.squareKilometre, // para
    10000000, // valor
  );
  print(area); // 10
}
```

### Intervalos de cores

|     |     |      |     |
| --- | --- | ---- | --- |
| HEX | HSV | HSLA | RGB |

```dart
main() {
  final hex = RGBColor(red: 255, green: 255, blue: 255).toHex;
  print(hex);
}
```

### Transmissão de dados

| bit | kilo     | mega     | giga     | tera     |
| --- | -------- | -------- | -------- | -------- |
|     | kibibit  | mebibit  | gibibit  | tebibit  |
| bit | kilobit  | megabit  | gigabit  | terabit  |
|     | kilobyte | megabyte | gigabyte | terabyte |

```dart
main() {
  final rate = convertDataTransferRate(
    DataTransferRate.gigabyte, // de
    DataTransferRate.megabyte, // para
    1, // valor
  );
  print(rate); // 1000
}
```

### Armazenamento de dados

| bit  | kilo     | mega     | giga     | tera     | peta     |
| ---- | -------- | -------- | -------- | -------- | -------- |
| bit  | kilobit  | megabit  | gigabit  | terabit  | petabit  |
| byte | kibibit  | mebibit  | gibibit  | tebibit  | pebibit  |
|      | kilobyte | megabyte | gigabyte | terabyte | petabyte |
|      | kibibyte | mebibyte | gibibyte | tebibyte | pebibyte |

```dart
main() {
  final storage = convertDigitalStorage(
    DigitalStorage.gigabyte, // de
    DigitalStorage.megabyte, // para
    1, // valor
  );
  print(storage); // 1000
}
```

### Energia

|               |                  |               |
| ------------- | ---------------- | ------------- |
| Joule         | Kilojoule        | Gram caloria  |
| Kilocaloria   | Watt-hora        | Kilowatt-hora |
| electron-volt | Unidade de calor | Libras-de-pé  |

```dart
main() {
  final energy = convertEnergy(
    Energy.kilocalorie, // de
    Energy.gramCalorie, // para
    1, // valor
  );
  print(energy); // 1000
}
```

### Frequência

|            |                 |                 |                 |
| ---------- | --------------- | --------------- | --------------- |
| Hertz (Hz) | Kilohertz (kHz) | Megahertz (mHz) | Gigahertz (gHz) |

```dart
main() {
  final frequency = convertEnergy(
    Frequency.megahertz, // de
    Frequency.hertz, // para
    1, // valor
  );
  print(frequency); // 1000000
}
```

### Consumo de combustível

|                           |                             |
| ------------------------- | --------------------------- |
| Km por litro              | Litro a cada 100 kilometros |
| Milha por galão americano | Milha por galão imperial    |

```dart
main() {
  final fuel = convertFuelEconomy(
    FuelEconomy.kilometerPerLitre, // de
    FuelEconomy.milePerUsGallon, // para
    1, // valor
  );
  print(fuel); // 2,35215
}
```

### Comprimento

|           |            |               |            |
| --------- | ---------- | ------------- | ---------- |
| Nanometro | Micrometro | Millimetro    | Centimetro |
| Metro     | Quilometro | Polegada      | Milha      |
| Jarda     | Pé         | Milha náutica |            |

```dart
main() {
  final length = convertLength(
    Length.centimeter, // de
    Length.meter, // para
    100, // valor
  );
  print(length); // 1
}
```

### Massa

|            |       |            |           |
| ---------- | ----- | ---------- | --------- |
| Tonelada   | Grama | Quilograma | Miligrama |
| Micrograma | Stone | Pound      | Ounce     |

```dart
main() {
  final mass = convertMass(
    Mass.kilogram, // de
    Mass.gram, // para
    1, // valor
  );
  print(mass); // 1000
}
```

### Ângulo

|         |                   |                    |
| ------- | ----------------- | ------------------ |
| Grau    | Gradian           | Miliradiano        |
| Rádiano | Minuto de um arco | Segundo de um arco |

```dart
main() {
  final angle = convertPlaneAngle(
    PlaneAngle.degree, // de
    PlaneAngle.minuteOfArc, // para
    1, // valor
  );
  print(angle); // 60
}
```

### Pressão

|                  |                  |      |
| ---------------- | ---------------- | ---- |
| Bar              | Pascal           | Torr |
| Pounc-force \in² | Atmosfera Padrão |      |

\in² = por polegada quadrada

```dart
main() {
  final pressure = convertPressure(
    Pressure.bar, // de
    Pressure.pascal, // para
    1, // valor
  );
  print(pressure); // 100000
}
```

### Velocidade

|          |      |         |              |      |
| -------- | ---- | ------- | ------------ | ---- |
| Milhas/h | Pé/s | Metro/s | Quilemetro/h | Knot |

```dart
main() {
  final speed = convertSpeed(
    Speed.metrePerSecond, // de
    Speed.kilometrePerHour, // para
    1, // valor
  );
  print(speed); // 3.6
}
```

### Temperatura

|         |            |        |
| ------- | ---------- | ------ |
| Celcius | Fahrenheit | Kelvin |

```dart
main() {
  final temperature = convertTemperature(
    Temperature.celcius, // de
    Temperature.fahrenheit, // para
    0, // valor
  );
  print(temperature); // 32
}
```

### Tempo

|             |              |             |         |        |
| ----------- | ------------ | ----------- | ------- | ------ |
| Nanosegundo | microsegundo | milisegundo | segundo | minuto |
| hora        | dia          | semana      | mês     | ano    |
| década      | século       | milênio     |         |        |

```dart
main() {
  final time = convertTime(
    Time.minute, // de
    Time.second, // para
    1, // valor
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
    Volume.litre, // de
    Volume.millilitre, // para
    1, // valor
  );
  print(volume); // 1000
}
```

## Using funções extensíveis (extension methods)

Instead of using `convert + unit name`, you can use `num.as + unit name`. For example, if I want to convert mass, I can do it with two ways:

### Usando a função convert

```dart
main() {
  final mass = convertMass(Mass.kilogram, Mass.gram, 10);
  print(mass);
}
```

### Usando as funções extensíveis

```dart
main() {
  final mass = 10.asMass(Mass.kilogram).toGram;
  print(mass);
}
```

Ambas terão o mesmo resultado. Você pode usar as funções extensíveis com os seguintes tipos de conversões:

- ✔️ Área
- ❌ Intervalos de cores
- ✔️ Transmissão de dados
- ✔️ Armazenamento de dados
- ✔️ Energia
- ✔️ Frequência
- ✔️ Consumo de combustível
- ✔️ Comprimento
- ✔️ Massa
- ✔️ Ângulo
- ✔️ Pressão
- ✔️ Velocidad
- ✔️ Temperatura
- ✔️ Tempo
- ✔️ Volume

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/bdlukaa/unities_helper/issues).
