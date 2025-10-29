import "package:crypto_app/widgets/auth/auth_header.dart";
import "package:crypto_app/widgets/auth/reset_password_form.dart";
import "package:flutter/material.dart";

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
      body: Container(
        padding: const EdgeInsets.only(top: 0, bottom: 30, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeader(
              title: 'Reset Password',
              text:
                  'This password should be different from the previous password.',
            ),
            const SizedBox(height: 24),
            ResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
