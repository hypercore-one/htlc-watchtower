import 'dart:math';

extension NumExtensions on num {
  int extractDecimals(int decimals) => (this * pow(10, decimals)).toInt();
}
