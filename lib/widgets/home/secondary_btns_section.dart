import 'package:flutter/material.dart';

class SecondaryBtnsSection extends StatefulWidget {
  const SecondaryBtnsSection({super.key});

  @override
  State<SecondaryBtnsSection> createState() => _SecondaryBtnsSectionState();
}

class _SecondaryBtnsSectionState extends State<SecondaryBtnsSection> {
  Widget _buildSecondaryButton({required String icon, required String label}) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Color.fromRGBO(215, 215, 215, 1)),
          ),
          child: Image.asset(icon, color: Colors.black, width: 24, height: 24),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSecondaryButton(
          icon: 'assets/images/home/airtime-icon.png',
          label: 'Airtime',
        ),
        const SizedBox(width: 40),
        _buildSecondaryButton(
          icon: 'assets/images/home/data-icon.png',
          label: 'Data',
        ),
      ],
    );
  }
}
