import "package:crypto_app/providers/auth_provider.dart";
import "package:crypto_app/widgets/labelled_input.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  ConsumerState<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  void _submitForgotPasswordForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Call the async login method
    _requestPasswordChange();
  }

  Future<void> _requestPasswordChange() async {
    ref.read(authProvider.notifier).setUserEmail(_emailController.text);
    Navigator.pushReplacementNamed(context, '/reset-password-otp');

    // try {
    // final result = await ref
    //     .read(authProvider.notifier)
    //     .login(
    //       email: _emailController.text.trim(),
    //       password: _passwordController.text,
    //     );

    // setState(() {
    //   _isLoading = false;
    // });

    // if (!mounted) return;

    //   if (result['success']) {
    //     // Show success message
    //     // SnackBarUtil.show(context, message: result['message'] ?? 'Login successful');
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(result['message'] ?? 'Login successful'),
    //         backgroundColor: Colors.green,
    //       ),
    //     );

    //     // Navigate to home or next screen
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (ctx) => const HomeScreen()),
    //     );
    //   } else {
    //     // Show error message
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(result['message'] ?? 'Login failed'),
    //         backgroundColor: Colors.red,
    //         duration: const Duration(seconds: 4),
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   setState(() {
    //     _isLoading = false;
    //   });

    //   if (!mounted) return;

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('An unexpected error occurred. Please try again.'),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LabeledInput(
            label: 'Email Address',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            placeholder: 'Enter Email Address',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email address';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value.trim())) {
                return 'Please enter a valid email address';
              }
              if (value.trim().length > 96) {
                return 'Email must be at most 96 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _isLoading ? null : _submitForgotPasswordForm,
              child: _isLoading
                  ? const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      'Send Code',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
