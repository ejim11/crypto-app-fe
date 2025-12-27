import 'package:crypto_app/enums/transaction_type.enum.dart';
import 'package:crypto_app/models/transaction.dart';

final List<Transaction> transactions = [
  Transaction(
    id: '1',
    title: 'Transfer to Adebayo(UBA)',
    amount: -150000,
    date: DateTime(2025, 9, 29, 15, 12),
    type: TransactionType.transfer,
  ),
  Transaction(
    id: '2',
    title: 'Airtime sent',
    amount: -2000,
    date: DateTime(2025, 9, 29, 15, 12),
    type: TransactionType.airtime,
  ),
  Transaction(
    id: '3',
    title: 'Deposit via Debit Card',
    amount: 70000,
    date: DateTime(2025, 9, 29, 15, 12),
    type: TransactionType.deposit,
  ),
  Transaction(
    id: '4',
    title: 'Deposit via Debit Card',
    amount: 45000,
    date: DateTime(2025, 9, 28, 16, 14),
    type: TransactionType.deposit,
  ),
  Transaction(
    id: '5',
    title: 'Deposit via Debit Card',
    amount: 7000,
    date: DateTime(2025, 9, 27, 15, 12),
    type: TransactionType.deposit,
  ),
  Transaction(
    id: '6',
    title: 'Transfer to Adebayo(UBA)',
    amount: -150000,
    date: DateTime(2025, 9, 27, 15, 12),
    type: TransactionType.transfer,
  ),
];
