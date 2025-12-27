import 'package:crypto_app/models/crypto_item.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final CryptoItem crypto;

  const CryptoCard({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final isPositive = crypto.changePercent >= 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Navigate to crypto detail screen
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Row(
            children: [
              // Crypto Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: crypto.iconColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.currency_bitcoin,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),

              // Name and Symbol
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crypto.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      crypto.symbol,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Price and Change
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${crypto.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${isPositive ? '+' : ''}${crypto.changePercent.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
