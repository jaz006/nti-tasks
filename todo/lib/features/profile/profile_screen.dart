import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/profile/change_password_screen.dart';
import 'package:todo/features/profile/settings_screen.dart';
import 'package:todo/features/profile/update_profile_sceen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
        child: ListView( 
          children: [
           SizedBox(
                width: 196,
                height: 60,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/Images/flag.png'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppColors.font,
                          ),
                        ),
                        Text(
                          'yasmine Amgad',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.font,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

               const SizedBox(height: 20),

               GestureDetector(
               onTap: () {
    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen(),
                      ),
                    );
                 },
             child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
              color: const Color(0xFFF7F5EF), 
               borderRadius: BorderRadius.circular(16.0),
    ),
    child: Row(
      children: [
        // Leading Icon from assets
        SvgPicture.asset(
          'assets/Images/Profile - Iconly Pro.svg', 
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 12.0),
        
        // Title Text
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400, 
            color: Color(0xFF24252C), 
          ),
        ),
        
        const Spacer(),
        
        
        const Icon(
          Icons.arrow_forward,
          size: 16.0,
          color: Color(0xFF24252C),
        ),
      ],
    ),
  ),
),   

 SizedBox(height: 20),

               GestureDetector(
               onTap: () {
    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                 },
             child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
              color: const Color(0xFFF7F5EF), 
               borderRadius: BorderRadius.circular(16.0),
    ),
    child: Row(
      children: [
        // Leading Icon from assets
        Image.asset(
          'assets/Images/Lock - Iconly Pro.png', 
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 12.0),
        
        // Title Text
        const Text(
          'Change Password',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400, 
            color: Color(0xFF24252C), 
          ),
        ),
        
        const Spacer(),
        
        
        const Icon(
          Icons.arrow_forward,
          size: 16.0,
          color: Color(0xFF24252C),
        ),
      ],
    ),
  ),
), 

const SizedBox(height: 20),

               GestureDetector(
               onTap: () {
    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      ),
                    );
                 },
             child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
              color: const Color(0xFFF7F5EF), 
               borderRadius: BorderRadius.circular(16.0),
    ),
    child: Row(
      children: [
        // Leading Icon from assets
        Image.asset(
          'assets/Images/Setting - Iconly Pro.png', 
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 12.0),
        
        // Title Text
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400, 
            color: Color(0xFF24252C), 
          ),
        ),
        
        const Spacer(),
        
        
        const Icon(
          Icons.arrow_forward,
          size: 16.0,
          color: Color(0xFF24252C),
        ),
      ],
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}