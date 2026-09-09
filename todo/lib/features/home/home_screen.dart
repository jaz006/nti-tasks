import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/profile/profile_screen.dart';
import 'package:todo/features/tasks/add_task_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        
            children: [
              // قسم الملف الشخصي (Header)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: SizedBox(
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
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'yasmine Amgad',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // باقي محتوى الصفحة (Tasks)
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Row(
   crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'Tasks',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black, // أو اللون المناسب للتصميم عندك
      ),
    ),
    const SizedBox(width: 8), // مسافة مناسبة بين الكلمة والرقم
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '5',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    ),
  ],
),
SizedBox(height: 20,) ,
TaskCardWidget(
      title: 'My First Task',
      description: 'Improve my English skills by trying to speek',
      date: '11/03/2025',
      time: '05:00 PM',
    ),
    TaskCardWidget(
      title: 'My Second Task',
      description: 'Practice Flutter UI development',
      date: '12/03/2025',
      time: '06:30 PM',
    ),
     Row(
      children: [
        Spacer(),
        GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(),
      ),
    );
  },
  child: Container(
    padding: EdgeInsets.all(12),
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 4,
          spreadRadius: 0,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: SizedBox(
      height: 24,
      width: 24,
      child: SvgPicture.asset(
        'assets/Images/Paper Plus - Iconly Pro.svg',
      ),
    ),
  ),
)
      ],
     )
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}


//reusable card
class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final Color backgroundColor;
  final Color textColor;

  const TaskCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.backgroundColor = const Color(0xFFB5DCD7), // اللون الجواني الأخضر/التركواز
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الجزء الخاص بالـ Title و Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // الجزء الخاص بالـ Date و Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: textColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}