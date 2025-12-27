import 'package:crypto_app/data/transactions_list.dart';
import 'package:crypto_app/models/transaction.dart';
import 'package:crypto_app/screens/transaction/transaction_details_screen.dart';
import 'package:crypto_app/widgets/home/header.dart';
import 'package:crypto_app/widgets/transactions/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  Map<String, List<Transaction>> get groupedTransactions {
    final Map<String, List<Transaction>> grouped = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (var transaction in transactions) {
      final transactionDate = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      String key;
      if (transactionDate == today) {
        key = 'Today';
      } else if (transactionDate == yesterday) {
        key = 'Yesterday';
      } else {
        key = DateFormat('dd/MM/yyyy').format(transactionDate);
      }

      if (!grouped.containsKey(key)) {
        grouped[key] = [];
      }
      grouped[key]!.add(transaction);
    }

    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Header(headerText: 'Transactions'),
              transactions.isEmpty
                  ? _buildEmptyState()
                  : Expanded(
                      child: Column(
                        children: [
                          // Transaction List
                          const SizedBox(height: 32),
                          Expanded(
                            child: ListView.builder(
                              // padding: const EdgeInsets.symmetric(
                              //   horizontal: 16,
                              // ),
                              itemCount: groupedTransactions.length,
                              itemBuilder: (context, index) {
                                final key = groupedTransactions.keys.elementAt(
                                  index,
                                );
                                final items = groupedTransactions[key]!;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 16,
                                      ),
                                      child: Text(
                                        key,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurface,
                                              fontSize: 13,
                                            ),
                                      ),
                                    ),
                                    ...items.map((transaction) {
                                      return TransactionTile(
                                        transaction: transaction,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionDetailScreen(
                                                    transaction: transaction,
                                                  ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/transaction/card_icon.png'),
            const SizedBox(height: 24),
            Text(
              'There Is No Transaction Here',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No transactions yet. It\'ll be ready when you start making transactions.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
