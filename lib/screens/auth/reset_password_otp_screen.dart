import 'package:crypto_app/providers/auth_provider.dart';
import 'package:crypto_app/widgets/auth/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordOtpScreen extends ConsumerWidget {
  const ResetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController pinController = TextEditingController();
    final userEmail = ref.watch(authProvider)?.userEmail;

    void verifyOtp() {
      Navigator.pushReplacementNamed(context, '/reset-password');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: OTPInputWidget(
          pinController: pinController,
          btnText: 'Verify',
          onBtnPressed: verifyOtp,
          title: 'Enter Code from Email',
          email: '$userEmail',
        ),
      ),
    );
  }
}
