import 'color.dart';

class HEXColor extends Color {
  /// The hex value. It must not start with `#` and
  /// the length must be equal to 8
  final String hex;

  HEXColor({this.hex = 'ffffffff'})
      : assert(!hex.startsWith('#')),
        assert(hex.length == 8);

  @override
  RGBAColor get toRGB {
    final hexDigits = hex.split('');
    final r = int.parse(hexDigits.sublist(0, 2).join(), radix: 16);
    final g = int.parse(hexDigits.sublist(2, 4).join(), radix: 16);
    final b = int.parse(hexDigits.sublist(4).join(), radix: 16);
    return RGBAColor(red: r, green: g, blue: b);
  }

  @override
  String toString() => '#$hex';
}
