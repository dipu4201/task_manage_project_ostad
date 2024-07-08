import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manage_1_project/ui/screen/auth/pin_verification_screen.dart';
import 'package:task_manage_1_project/ui/utility/app_colors.dart';
import 'package:task_manage_1_project/ui/widget/background_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

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
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 Digit Verification Pin Will Be Sent To Your Email Address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email'
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _onTapConfirmButton();
                    },
                    child:const Icon(Icons.arrow_circle_down_outlined),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 36),
                        RichText(text: TextSpan(
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                          text: 'Have Account?',
                          children: [
                              TextSpan(
                                  text: 'Sign In',
                                  style: const TextStyle(color: AppColors.themeColor),
                                  recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignInButton (){
    Navigator.pop(context);
  }
  void _onTapConfirmButton (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => PinVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
   _emailTEController.dispose();
    super.dispose();
  }
}
