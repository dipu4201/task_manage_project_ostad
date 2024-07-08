import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manage_1_project/data/models/network_response.dart';
import 'package:task_manage_1_project/data/network_caller/network_caller.dart';
import 'package:task_manage_1_project/data/utilitis/urls.dart';
import 'package:task_manage_1_project/ui/utility/app_colors.dart';
import 'package:task_manage_1_project/ui/utility/app_constans.dart';
import 'package:task_manage_1_project/ui/widget/background_widget.dart';
import 'package:task_manage_1_project/ui/widget/snack_bar_massage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _registrationInProgress = false;

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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: 'Email'),
                      autovalidateMode: AutovalidateMode.always,
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
                      controller: _firstNameTEController,
                      decoration: const InputDecoration(hintText: 'First Name'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your First Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameTEController,
                      decoration: const InputDecoration(hintText: 'Last Name'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your Last Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'Mobile'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your Mobile Number';
                        }
                        // if (AppConstants.mobileRegEx.hasMatch(value!)== false){
                        //   return 'Enter a Valid Phone Number';
                        // }
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
                      visible: _registrationInProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _registerUser();
                          }
                        },
                        child: const Icon(Icons.arrow_circle_down_outlined),
                      ),
                    ),
                    _buildBackToSignInSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _buildBackToSignInSection() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 28),
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
                    style: const TextStyle(color: AppColors.themeColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _onTapSignInButton),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _registerUser() async {
    _registrationInProgress=true;
    if (mounted){
      setState(() {});
    }
    Map<String, dynamic > requestInput = {

      "email":_emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile":_mobileTEController.text.trim(),
      "password":_passwordTEController.text,
      "photo":""
    };
    NetworkResponse response = await NetworkCaller.postRequest(
        Urls.registration, body: requestInput);
    _registrationInProgress=false;
    if (mounted){
      setState(() {});
    }
    if (response.isSuccess){
      _clearTextFields();
      if (mounted) {
        showSnackBarMassage(context, 'Registration Success');
      }
    } else {
      if (mounted) {
        showSnackBarMassage(
            context, response.errorMassage ?? 'Registration Failed! Try Again');
      }
    }
  }

  void _clearTextFields(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
