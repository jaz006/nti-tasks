import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/auth_screens/register_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView(
            children: [ 
              Container(
                child: SvgPicture.asset(
             'assets/Images/onboarding.svg',
                 width: 301.7,
                  height: 342.86,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 26),
              
              SizedBox(
                width:147,
                height: 60,
                child: Text(
                  'Welcome To\nDo It !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:FontWeight.w400 ,
                    color: AppColors.font,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              // Subtitle / Description
              SizedBox(
                width: 314,
                height: 40,
                child: Text(
                  'Ready to conquer your tasks? Let\'s Do\nIt together.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.hintfont,
                  ),
                ),
              ),

               SizedBox(height: 26),
               GestureDetector(
             onTap: () {
            Navigator.push(
            context,
           MaterialPageRoute(
          builder: (context) => RegisterScreen(), 
           ),
    );
  },
  child: Container(
    width: double.infinity,
    height: 56,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF149954).withValues(alpha: 0.80),
          blurRadius: 10,
          spreadRadius: 0,
          offset:Offset(0, 5),
        ),
      ],
    ),
    child: const Text(
      "Let's Start",
      style: TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.w300,
      ),
    ),
  ),
),
              
            ],
          ),
        ),
      ),
    );
  }
}