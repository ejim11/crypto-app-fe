import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OTPInputWidget extends StatefulWidget {
  final String title;
  final String email;
  final String btnText;
  final Function() onBtnPressed;
  final TextEditingController pinController;
  const OTPInputWidget({
    super.key,
    required this.title,
    required this.email,
    required this.pinController,
    required this.btnText,
    required this.onBtnPressed,
  });

  @override
  State<OTPInputWidget> createState() => _OTPInputWidgetState();
}

class _OTPInputWidgetState extends State<OTPInputWidget> {
  bool _isError = false;
  bool _isCounting = true;

  @override
  void dispose() {
    widget.pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 80,
      height: 80,
      textStyle: TextStyle(
        fontSize: 22,
        color: Theme.of(context).colorScheme.primary,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  'We sent a code to ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.email,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Pinput(
          controller: widget.pinController,
          length: 4,
          // obscureText: true,
          separatorBuilder: (index) => const SizedBox(width: 10),
          forceErrorState: _isError,
          defaultPinTheme: defaultPinTheme.copyWith(
            textStyle: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: 40),
            decoration: defaultPinTheme.decoration!.copyWith(
              color: Colors.white,
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          followingPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: Colors.white,
              border: Border.all(color: Color.fromRGBO(213, 215, 218, 1)),
            ),
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            decoration: defaultPinTheme.decoration!.copyWith(
              // border: Border.all(color: focusedBorderColor),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            textStyle: const TextStyle(color: Colors.red),
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              if (widget.pinController.text.length < 4) {
                setState(() {
                  _isError = true;
                });
                return;
              }
              setState(() {
                _isError = false;
              });
              widget.onBtnPressed();
            },
            child: Text(
              widget.btnText,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        _isCounting
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Resend code in ',
                    style: TextStyle(color: Color.fromRGBO(128, 128, 131, 1)),
                  ),
                  Countdown(
                    seconds: 30,
                    build: (BuildContext context, double time) => Text(
                      // time.,
                      time.floor().toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(128, 128, 131, 1),
                      ),
                    ),
                    interval: const Duration(milliseconds: 1000),
                    onFinished: () {
                      setState(() {
                        _isCounting = false;
                      });
                    },
                  ),
                ],
              )
            : Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Didn\'t recieve any code?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend code',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (ctx) => const Login(),
                            //   ),
                            // );
                          },
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
