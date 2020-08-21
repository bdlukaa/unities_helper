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

//  A simple binary converter
class Binary {
  /// Binary from
  ///
  /// Use this on the global convert function
  ///
  /// It can assume the [from] and [to] arguments.
  /// If this assume [from], then [to] needs to be [BinaryTo], or vice-versa.
  ///
  /// If [to] is [BinaryFrom], then it will convert from binary to text,
  /// but if it's [BinaryTo], it will convert from text to binary.
  static BinaryFrom get from => BinaryFrom();

  /// Binary to
  ///
  /// Use this on the global convert function
  ///
  /// It can assume the [from] and [to] arguments.
  /// If this assume [from], then [to] needs to be [BinaryFrom], or vice-versa.
  ///
  /// If [to] is [BinaryFrom], then it will convert from binary to text,
  /// but if it's [BinaryTo], it will convert from text to binary.
  static BinaryTo get to => BinaryTo();

  final String text;
  String separator;

  Binary({this.text, this.separator});

  String get toBinary => textToBinary(text, separator: separator);
  String get toText => binaryToText(text);
}

class BinaryFrom extends Binary {
  @override
  final String separator;

  BinaryFrom({this.separator});

  BinaryFrom withSeparator(String separator) =>
      BinaryFrom(separator: separator);
}

class BinaryTo extends Binary {
  @override
  final String separator;

  BinaryTo({this.separator});

  BinaryTo withSeparator(String separator) => BinaryTo(separator: separator);
}

/// Convert a binary string to text
///
/// It must be only binary characters, otherwise an error is thrown.
/// The binary characters must be separated by an space ( )
///
/// The [binary] argument must not be null!
String binaryToText(String binary, {String separator}) {
  assert(binary != null);
  var newBin = binary.split(' ');
  var binCode = [];

  for (var i = 0; i < newBin.length; i++) {
    binCode.add(String.fromCharCode(int.parse(newBin[i], radix: 2)));
  }
  return binCode.join(separator ?? '');
}

/// Convert a text into a binary string
///
/// [text] must not be null!
///
/// You can add a separator between each letter with [separator]
String textToBinary(String text, {String separator}) {
  assert(text != null);
  return text.codeUnits
      .map((int strInt) => strInt.toRadixString(2).padLeft(8, '0'))
      .join(separator ?? '');
}

extension BinaryExt on String {
  Binary asBinary({String separator}) => Binary(
        text: this,
        separator: separator,
      );
}
