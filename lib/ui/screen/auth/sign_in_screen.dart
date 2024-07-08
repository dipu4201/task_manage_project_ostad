import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manage_1_project/data/models/login_model.dart';
import 'package:task_manage_1_project/data/models/network_response.dart';
import 'package:task_manage_1_project/data/network_caller/network_caller.dart';
import 'package:task_manage_1_project/data/utilitis/urls.dart';
import 'package:task_manage_1_project/ui/controller/auth_controller.dart';
import 'package:task_manage_1_project/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manage_1_project/ui/screen/main_bottom_nav_screen.dart';
import 'package:task_manage_1_project/ui/utility/app_colors.dart';
import 'package:task_manage_1_project/ui/utility/app_constans.dart';
import 'package:task_manage_1_project/ui/widget/background_widget.dart';
import 'package:task_manage_1_project/ui/widget/snack_bar_massage.dart';
import 'email_verificatin_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _signInApiProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'Get Started With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your Email';
                        }
                        if (AppConstants.emailRegEx.hasMatch(value!) == false) {
                          return 'Enter Valid Email Address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: _showPassword == false,
                      controller: _passwordTEController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            _showPassword = !_showPassword;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          icon: Icon(_showPassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: _signInApiProgress==false,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _onTapNextButton();
                        },
                        child: const Icon(Icons.arrow_circle_down_outlined),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 36),
                          TextButton(
                            onPressed: () {
                              _onTapForgotPasswordButton();
                            },
                            child: Text('Forgot Password?'),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                              ),
                              text: 'Don\'t Have an Account?',
                              children: [
                                TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                        color: AppColors.themeColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = _onTapSignUpButton),
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
      ),
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    _signInApiProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestData = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.login, body: requestData);
    _signInApiProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainBottomNavScreen(),
        ),
      );
    } else {
      showSnackBarMassage(context,
          response.errorMassage ?? 'Email or Password Not Correct');
    }
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => const SignUpScreen(),
      ),
    );
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => const EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
