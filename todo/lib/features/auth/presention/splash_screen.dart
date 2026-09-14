import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/helper/app_navigation.dart';
import 'package:todo/core/utils/apps_assets.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/auth/presention/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      MyNavigator.goTo(context, toPage: OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: SvgPicture.asset(AppSvgs.logo)),
    );
  }
}
