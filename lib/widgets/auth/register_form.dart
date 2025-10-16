import "package:crypto_app/screens/auth/login_screen.dart";
import "package:crypto_app/services/auth_service.dart";
import "package:flutter/material.dart";

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _enteredFirstnameController = TextEditingController();
  final _enteredLastnameController = TextEditingController();
  final _enteredEmailController = TextEditingController();
  final _enteredPasswordController = TextEditingController();
  final _enteredPhoneNumberController = TextEditingController();

  bool _passwordVisible = false;
  bool _passwordIsChanging = false;
  bool _isLoading = false;

  // Password validators
  bool _passwordMinimum = false;
  bool _passwordContainsLetter = false;
  bool _passwordContainsNumber = false;
  bool _passwordContainsSpecialCharacters = false;

  // Country codes
  String _selectedCountryCode = '+234'; // Nigeria default
  final Map<String, String> _africaCountryCodes = {
    '+234': 'NG',
    '+27': 'ZA',
    '+256': 'UG',
    '+254': 'KE',
    '+233': 'GH',
  };

  void _submitCreateAccForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await AuthService.registerUser(
        firstname: _enteredFirstnameController.text.trim(),
        lastname: _enteredLastnameController.text.trim(),
        email: _enteredEmailController.text.trim(),
        password: _enteredPasswordController.text,
        phoneNumber:
            '$_selectedCountryCode${_enteredPhoneNumberController.text.trim()}',
      );

      setState(() {
        _isLoading = false;
      });

      if (!mounted) return;

      if (result['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message']),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => const Login()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message']),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _checkPasswordMinimum() {
    setState(() {
      _passwordMinimum = _enteredPasswordController.text.length >= 8;
    });
  }

  void _checkPasswordContainsLetter() {
    setState(() {
      _passwordContainsLetter = RegExp(
        r'[a-zA-Z]',
      ).hasMatch(_enteredPasswordController.text);
    });
  }

  void _checkPasswordContainsNumber() {
    setState(() {
      _passwordContainsNumber = RegExp(
        r'\d',
      ).hasMatch(_enteredPasswordController.text);
    });
  }

  void _checkPasswordContainsSpecialCharacters() {
    setState(() {
      _passwordContainsSpecialCharacters = RegExp(
        r'[\W_]',
      ).hasMatch(_enteredPasswordController.text);
    });
  }

  @override
  void dispose() {
    _enteredFirstnameController.dispose();
    _enteredLastnameController.dispose();
    _enteredEmailController.dispose();
    _enteredPasswordController.dispose();
    _enteredPhoneNumberController.dispose();
    super.dispose();
  }

  Widget _buildLabeledInput({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    required String placeholder,
    TextInputAction textInputAction = TextInputAction.next,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,

          onChanged: onChanged,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 14,
              letterSpacing: -0.5,
            ),
            hintText: placeholder,
            fillColor: Color.fromRGBO(248, 251, 255, 1),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(213, 215, 218, 1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPhoneNumberInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: _enteredPhoneNumberController,
          keyboardType: TextInputType.phone,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Enter your phone number',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 14,
              letterSpacing: -0.5,
            ),
            fillColor: Color.fromRGBO(248, 251, 255, 1),
            prefixIcon: PopupMenuButton<String>(
              offset: const Offset(0, 40),
              onSelected: (value) {
                setState(() {
                  _selectedCountryCode = value;
                });
              },
              itemBuilder: (BuildContext context) {
                return _africaCountryCodes.entries
                    .map(
                      (entry) => PopupMenuItem<String>(
                        value: entry.key,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(entry.value),
                            const SizedBox(width: 8),
                            Text(
                              entry.key,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _africaCountryCodes[_selectedCountryCode] ?? 'NG',
                      style: const TextStyle(
                        color: Color.fromRGBO(24, 29, 39, 1),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp, size: 20),
                    const SizedBox(width: 10),
                    Text(_selectedCountryCode),
                  ],
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(213, 215, 218, 1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter phone number';
            }
            if (value.trim().length < 10) {
              return 'Phone number must be at least 10 digits';
            }
            if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
              return 'Phone number must contain only digits';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordRequirement(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 16,
            color: isValid ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isValid ? Colors.green : Colors.grey[700],
              fontWeight: isValid ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildLabeledInput(
            label: 'First Name',
            controller: _enteredFirstnameController,
            keyboardType: TextInputType.name,
            placeholder: 'First name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your first name';
              }
              if (value.trim().length < 3) {
                return 'First name must be at least 3 characters';
              }
              if (value.trim().length > 96) {
                return 'First name must be at most 96 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildLabeledInput(
            label: 'Last Name',
            controller: _enteredLastnameController,
            keyboardType: TextInputType.name,
            placeholder: 'Last name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your last name';
              }
              if (value.trim().length < 3) {
                return 'Last name must be at least 3 characters';
              }
              if (value.trim().length > 96) {
                return 'Last name must be at most 96 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildLabeledInput(
            label: 'Email Address',
            controller: _enteredEmailController,
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
          const SizedBox(height: 16),
          _buildPhoneNumberInput(),
          const SizedBox(height: 16),
          _buildLabeledInput(
            label: 'Password',
            controller: _enteredPasswordController,
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
                  ? Icon(
                      Icons.visibility_off_outlined,
                      color: Color.fromRGBO(96, 96, 96, 1),
                    )
                  : Icon(
                      Icons.visibility_outlined,
                      color: Color.fromRGBO(96, 96, 96, 1),
                    ),
            ),
            onChanged: (value) {
              setState(() {
                _passwordIsChanging = true;
              });
              _checkPasswordMinimum();
              _checkPasswordContainsLetter();
              _checkPasswordContainsNumber();
              _checkPasswordContainsSpecialCharacters();
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
          if (_passwordIsChanging) ...[
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password must contain:',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildPasswordRequirement(
                    'At least 8 characters',
                    _passwordMinimum,
                  ),
                  _buildPasswordRequirement(
                    'At least one letter',
                    _passwordContainsLetter,
                  ),
                  _buildPasswordRequirement(
                    'At least one number',
                    _passwordContainsNumber,
                  ),
                  _buildPasswordRequirement(
                    'At least one special character',
                    _passwordContainsSpecialCharacters,
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _isLoading ? null : _submitCreateAccForm,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      'Create Account',
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
