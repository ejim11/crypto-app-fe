import "package:crypto_app/widgets/labelled_input.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ResetPasswordForm extends ConsumerStatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  ConsumerState<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  // bool _passwordIsChanging = false;
  bool _isLoading = false;

  void _submitLoginForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Call the async login method
    _resetPassword();
  }

  Future<void> _resetPassword() async {}

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LabeledInput(
            label: 'Password',
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !_passwordVisible,
            placeholder: 'Minimum of 8 Characters',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: _passwordVisible
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Color.fromRGBO(96, 96, 96, 1),
                    )
                  : const Icon(
                      Icons.visibility_outlined,
                      color: Color.fromRGBO(96, 96, 96, 1),
                    ),
            ),
            onChanged: (value) {
              if (_confirmPasswordController.text.isNotEmpty) {
                _formKey.currentState?.validate();
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              if (value.length > 96) {
                return 'Password must be at most 96 characters';
              }
              if (!RegExp(
                r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
              ).hasMatch(value)) {
                return 'Must have at least one letter, number and special character';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          LabeledInput(
            label: 'Confirm Password',
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !_passwordVisible,
            placeholder: 'Minimum of 8 Characters',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: _passwordVisible
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Color.fromRGBO(96, 96, 96, 1),
                    )
                  : const Icon(
                      Icons.visibility_outlined,
                      color: Color.fromRGBO(96, 96, 96, 1),
                    ),
            ),
            onChanged: (value) {
              // Re-validate on every change
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              if (value.length > 96) {
                return 'Password must be at most 96 characters';
              }
              if (!RegExp(
                r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
              ).hasMatch(value)) {
                return 'Must have at least one letter, number and special character';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
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
              onPressed: _isLoading ? null : _submitLoginForm,
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
                      'Reset Password',
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
