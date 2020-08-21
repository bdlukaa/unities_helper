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

import 'dart:convert';
import 'dart:typed_data';

List<int> longHexadecimalToInt(String hexadecimal) {
  final list = <int>[];
  for (var i = 0; i <= hexadecimal.length - 8; i += 8) {
    final hex = hexadecimal.substring(i, i + 8);
    int number;
    try {
      number = int.parse(hex, radix: 16);
    } catch (e) {
      number = BigInt.parse(hex, radix: 16).toInt();
    }
    list.add(number);
  }
  return list;
}

String encodeHex(List<int> bytes) => HexCodec().encoder.convert(bytes);
List<int> decodeHex(String hex) => HexCodec().decoder.convert(hex);

extension StringHexExt on String {
  HexadecimalString asHexadecimal() => HexadecimalString(this);
}

extension ListIntHexExt on List<int> {
  HexadecimalIntList asHexadecimal() => HexadecimalIntList(this);
}

class HexadecimalString {
  final String value;
  HexadecimalString(this.value) : assert(value != null);

  List<int> get decode => decodeHex(value);
}

class HexadecimalIntList {
  final List<int> value;
  HexadecimalIntList(this.value) : assert(value != null);

  String get encode => encodeHex(value);
}

const String _ALPHABET = '0123456789abcdef';

/// A codec for encoding and decoding byte arrays to and from
/// hexadecimal strings.
class HexCodec extends Codec<List<int>, String> {
  const HexCodec();

  @override
  Converter<List<int>, String> get encoder => const HexEncoder();

  @override
  Converter<String, List<int>> get decoder => const HexDecoder();
}

/// A converter to encode byte arrays into hexadecimal strings.
class HexEncoder extends Converter<List<int>, String> {
  /// If true, the encoder will encode into uppercase hexadecimal strings.
  final bool upperCase;

  const HexEncoder({this.upperCase = false});

  @override
  String convert(List<int> bytes) {
    final buffer = StringBuffer();
    for (final part in bytes) {
      if (part & 0xff != part) {
        throw FormatException('Non-byte integer detected');
      }
      buffer.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    if (upperCase) {
      return buffer.toString().toUpperCase();
    } else {
      return buffer.toString();
    }
  }
}

/// A converter to decode hexadecimal strings into byte arrays.
class HexDecoder extends Converter<String, List<int>> {
  const HexDecoder();

  @override
  List<int> convert(String hex) {
    var str = hex.replaceAll(' ', '');
    str = str.toLowerCase();
    if (str.length % 2 != 0)
      // ignore: curly_braces_in_flow_control_structures
      str = '0' + str;
    final result = Uint8List(str.length ~/ 2);
    for (var i = 0; i < result.length; i++) {
      final firstDigit = _ALPHABET.indexOf(str[i * 2]);
      final secondDigit = _ALPHABET.indexOf(str[i * 2 + 1]);
      if (firstDigit == -1 || secondDigit == -1)
        // ignore: curly_braces_in_flow_control_structures
        throw FormatException('Non-hex character detected in $hex');
      result[i] = (firstDigit << 4) + secondDigit;
    }
    return result;
  }
}
