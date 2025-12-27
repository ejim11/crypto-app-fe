import 'dart:ui';

import 'package:crypto_app/models/crypto_item.dart';

final List<CryptoItem> cryptoList = [
  CryptoItem(
    name: 'Bitcoin',
    symbol: 'BTC',
    price: 66771.10,
    changePercent: -1.47,
    iconColor: Color(0xFFF7931A),
  ),
  CryptoItem(
    name: 'Ethereum',
    symbol: 'ETH',
    price: 3245.50,
    changePercent: 2.35,
    iconColor: Color(0xFF627EEA),
  ),
  CryptoItem(
    name: 'Cardano',
    symbol: 'ADA',
    price: 0.45,
    changePercent: -0.85,
    iconColor: Color(0xFF0033AD),
  ),
  CryptoItem(
    name: 'Solana',
    symbol: 'SOL',
    price: 145.30,
    changePercent: 5.20,
    iconColor: Color(0xFF14F195),
  ),
  CryptoItem(
    name: 'Polkadot',
    symbol: 'DOT',
    price: 7.25,
    changePercent: -2.10,
    iconColor: Color(0xFFE6007A),
  ),
];
