import 'package:crypto_app/widgets/home/account_setup_card.dart';
import 'package:crypto_app/widgets/home/action_btns_section.dart';
import 'package:crypto_app/widgets/home/balance_section.dart';
import 'package:crypto_app/widgets/home/header.dart';
import 'package:crypto_app/widgets/home/secondary_btns_section.dart';
import 'package:crypto_app/widgets/home/transaction_history.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(headerText: 'Welcome, John'),
                      const SizedBox(height: 32),
                      BalanceSection(),
                      const SizedBox(height: 32),
                      ActionBtnsSection(),
                      const SizedBox(height: 24),
                      SecondaryBtnsSection(),
                      const SizedBox(height: 32),
                      AccountSetupCard(),
                      const SizedBox(height: 24),
                      TransactionHistory(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
