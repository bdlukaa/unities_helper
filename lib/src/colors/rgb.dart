import 'color.dart';

class RGBAColor extends Color {
  final int red;
  final int green;
  final int blue;
  final int alpha;

  const RGBAColor({
    this.red = 255,
    this.green = 255,
    this.blue = 255,
    this.alpha = 255,
  })  : assert(red != null),
        assert(red >= 0 && red <= 255),
        assert(green != null),
        assert(green >= 0 && green <= 255),
        assert(blue != null),
        assert(blue >= 0 && blue <= 255),
        assert(alpha != null),
        assert(alpha >= 0 && alpha <= 255);

  String get _aHex => alpha.toRadixString(16).padLeft(2, '0');
  String get _rHex => red.toRadixString(16).padLeft(2, '0');
  String get _gHex => green.toRadixString(16).padLeft(2, '0');
  String get _bHex => blue.toRadixString(16).padLeft(2, '0');

  @override
  HEXColor get toHex => HEXColor(hex: '$_rHex$_gHex$_bHex$_aHex');

  @override
  RGBAColor get toRGB => this;

  @override
  String toString() => 'rgba($red, $green, $blue, $alpha)';
}
