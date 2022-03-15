import 'dart:convert';

class PhotoResolution {
  final String original;
  final String large;
  final String medium;
  final String small;

  PhotoResolution({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
  });

  factory PhotoResolution.fromMap(Map<String, dynamic> map) {
    return PhotoResolution(
      original: map['original'] ?? '',
      large: map['large'] ?? '',
      medium: map['medium'] ?? '',
      small: map['small'] ?? '',
    );
  }
}
