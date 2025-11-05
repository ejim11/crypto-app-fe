import 'package:flutter/material.dart';

class AccountSetupCard extends StatelessWidget {
  const AccountSetupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color.fromRGBO(227, 227, 227, 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete Account Setup',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'A few quick steps left to get started.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(227, 227, 227, 1)),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 241, 169, 1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '0%',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 12,
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
}
