import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Balance',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.visibility_outlined,
                size: 17,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'N',
                style: GoogleFonts.outfit(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 32,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
                // style: TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 2),
              Text(
                '0.00',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 44,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
