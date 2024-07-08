import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manage_1_project/ui/screen/auth/reset_password_screen.dart';
import 'package:task_manage_1_project/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manage_1_project/ui/utility/app_colors.dart';
import 'package:task_manage_1_project/ui/widget/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Pin Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 Digit Verification Pin Has Been Sent To Your Email Address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 25),
                  _buildPinCodeTextField(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _onTapVerifyOtpButton();
                    },
                    child: Text('Verify'),
                  ),
                  _buildSignInSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 36),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                          text: 'Have Account?',
                          children: [
                            TextSpan(
                                text: 'Sign In',
                                style: const TextStyle(
                                    color: AppColors.themeColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSignInButton),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedColor: AppColors.themeColor),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      controller: _pinTEController,
      appContext: context,
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
        (route) => false
    );
  }
  void _onTapVerifyOtpButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        ),
    );
  }

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }
}
