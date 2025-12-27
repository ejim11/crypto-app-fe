import 'package:crypto_app/enums/transaction_type.enum.dart';
import 'package:crypto_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    final isPositive = transaction.amount > 0;

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 251, 255, 1),
        elevation: 0,
        leading: Container(
          width: 42,
          height: 42,
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'Transaction Details',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // Success Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Provider Badge (if airtime)
                    if (transaction.type == TransactionType.airtime)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'MTN',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Amount
                    Text(
                      '${isPositive ? '+' : '-'}N${formatter.format(transaction.amount.abs())}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: isPositive
                            ? Colors.green
                            : Color.fromRGBO(207, 5, 3, 1),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Status
                    Text(
                      'Transaction Successful',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Transaction Details Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 250, 251, 1),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            blurRadius: 16.6,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            'Recipient Mobile',
                            '08012345678',
                            context,
                          ),
                          const SizedBox(height: 20),
                          _buildDetailRow(
                            'Transaction Type',
                            transaction.type == TransactionType.airtime
                                ? 'Airtime'
                                : transaction.type == TransactionType.transfer
                                ? 'Transfer'
                                : 'Deposit',
                            context,
                          ),
                          const SizedBox(height: 20),
                          _buildDetailRow(
                            'Amount',
                            'N${formatter.format(transaction.amount.abs())}',
                            context,
                          ),
                          const SizedBox(height: 20),
                          _buildDetailRow('Network Provider', 'MTN', context),
                          const SizedBox(height: 20),
                          _buildDetailRow(
                            'Transaction No',
                            '20251234567890',
                            context,
                          ),
                          const SizedBox(height: 20),
                          _buildDetailRow(
                            'Transaction Date',
                            DateFormat('MMM dd, yyyy').format(transaction.date),
                            context,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Share Receipt Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 16.6,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Share receipt logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Share Receipt',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
