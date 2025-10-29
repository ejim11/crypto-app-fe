import 'package:crypto_app/widgets/auth/auth_header.dart';
import 'package:crypto_app/widgets/auth/forgot_password_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            AuthHeader(
              title: 'Enter Email Address',
              text:
                  'Enter the email address with your account and we’ll send an email with confirmation to reset your password',
            ),
            const SizedBox(height: 24),
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
