import 'package:flutter/material.dart';

class ActionBtnsSection extends StatefulWidget {
  const ActionBtnsSection({super.key});

  @override
  State<ActionBtnsSection> createState() => _ActionBtnsSectionState();
}

class _ActionBtnsSectionState extends State<ActionBtnsSection> {
  Widget _buildActionButton({
    required String icon,
    required String label,
    required Color color,
    required Color iconColor,
  }) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Color.fromRGBO(215, 215, 215, 1)),
          ),
          child: Image.asset(icon, color: iconColor, width: 24, height: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          icon: 'assets/images/home/deposit-icon.png',
          label: 'Deposit',
          color: Theme.of(context).colorScheme.primary,
          iconColor: Colors.white,
        ),
        _buildActionButton(
          icon: 'assets/images/home/buy-icon.png',
          label: 'Buy',
          color: Colors.white,
          iconColor: Colors.black,
        ),
        _buildActionButton(
          icon: 'assets/images/home/sell-icon.png',
          label: 'Sell',
          color: Colors.white,
          iconColor: Colors.black,
        ),
        _buildActionButton(
          icon: 'assets/images/home/swap-icon.png',
          label: 'Swap',
          color: Colors.white,
          iconColor: Colors.black,
        ),
      ],
    );
  }
}
