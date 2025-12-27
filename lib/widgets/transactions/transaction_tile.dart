import 'package:crypto_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onTap;

  const TransactionTile({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.amount > 0;
    final formatter = NumberFormat('#,###');

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(227, 227, 227, 1),
                ),
              ),
              child: Icon(
                isPositive ? Icons.arrow_downward : Icons.arrow_outward,
                size: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12),

            // Title and Date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('h:mma • dd/MM/yyyy').format(transaction.date),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Amount
            Text(
              '${isPositive ? '+' : '-'}N${formatter.format(transaction.amount.abs())}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 16,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
