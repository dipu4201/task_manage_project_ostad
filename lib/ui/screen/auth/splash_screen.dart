import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manage_1_project/ui/controller/auth_controller.dart';
import 'package:task_manage_1_project/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manage_1_project/ui/screen/main_bottom_nav_screen.dart';
import 'package:task_manage_1_project/ui/widget/background_widget.dart';
import '../../utility/assests_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    bool isUserLoggedIn = await AuthController.checkAuthState();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isUserLoggedIn
              ? const MainBottomNavScreen()
              : const SignInScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SvgPicture.asset(
            AssestsPath.logoSvg,
            width: 140,
          ),
        ),
      ),
    );
  }
}
