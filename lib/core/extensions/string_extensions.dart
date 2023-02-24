// coverage:ignore-file
import 'dart:convert';
import 'dart:typed_data';

extension StringExtension on String {
  String get capitalize {
    if (trim().isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get titleCase {
    if (trim().isEmpty) return this;
    return split(' ').map<String>((e) => e.capitalize).toList().join(' ');
  }

  bool get isNumericCommaDot {
    return RegExp(r'^[0-9.,]+$').hasMatch(this);
  }

  Uint8List get toUint8List {
    return base64Decode(this);
  }

  String get removeUnderscore {
    return split('_').join(' ').trim().titleCase;
  }

  bool get isNumeric {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }

  bool get isNumericNoComma {
    return RegExp(r'^[0-9.]+$').hasMatch(this);
  }

  bool get isAlpha {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(this);
  }

  bool get isValidPlateNumber {
    return RegExp(r'^[a-zA-Z0-9 -]+$').hasMatch(this);
  }

  String get upperCamelCase {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// appends an alphabet from a-z to the end of the string depending on the
  /// index
  String alpha(int index) {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    return '$this ${alphabet[index]}';
  }

  bool get validEmail {
    return RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(this);
  }

  String get obscureEmail {
    // Split the email into username and domain
    final index = indexOf('@');
    var username = substring(0, index);
    final domain = substring(index + 1);
    // Obscure the username and display only the first and last characters
    username = '${username[0]}****${username[username.length - 1]}';
    // Return the obscured email
    return '$username@$domain';
  }

  String get rightType {
    return replaceAll('Future', '')
        .replaceAll('<', '')
        .replaceAll('>', '')
        .replaceAll('Either', '')
        .replaceAll('Failure', '')
        .replaceAll(',', '')
        .trim();
  }

  Map<String, String> get toHeader => {
        'Authorization': 'Bearer $this',
        'Content-Type': 'application/json; charset=UTF-8',
      };

  String get initials {
    final words = split(' ');
    if (words.length > 2) {
      words.removeRange(1, words.length - 1);
    }
    final initials = words.map((word) => word[0]).toList();
    return initials.join().toUpperCase();
  }


}
