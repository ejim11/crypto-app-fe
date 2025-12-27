import 'dart:ui';

class CryptoItem {
  final String name;
  final String symbol;
  final double price;
  final double changePercent;
  final Color iconColor;

  CryptoItem({
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercent,
    required this.iconColor,
  });
}
