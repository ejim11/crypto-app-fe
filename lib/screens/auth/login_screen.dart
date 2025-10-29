import "package:crypto_app/screens/auth/register_screen.dart";
import "package:crypto_app/widgets/auth/auth_header.dart";
import "package:crypto_app/widgets/auth/login_form.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 0,
                    bottom: 30,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/auth_icon.png',
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(height: 16),
                      AuthHeader(
                        title: 'Sign In',
                        text: 'Log in to start using your account',
                      ),
                      const SizedBox(height: 24),
                      const LoginForm(),
                      const SizedBox(height: 16),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: const Color.fromRGBO(
                                    134,
                                    134,
                                    134,
                                    0.7,
                                  ),
                                  fontSize: 14,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Create account',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => const Register(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
