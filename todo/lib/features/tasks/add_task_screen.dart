import 'package:flutter/material.dart';
import 'package:todo/core/utils/apps_colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Task',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 207,
              width: 261,
              child: ClipRRect(
                 borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/Images/flag.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _titleController,
              style: TextStyle(
                color: AppColors.font,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: AppColors.font,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
                filled: true,
                fillColor: Color(0xFFF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                 
                ),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _descriptionController,
              style: TextStyle(
                color: AppColors.font,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(
                  color: AppColors.font,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
                filled: true,
                fillColor: Color(0xFFF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  
                ),
              ),
            ),

            SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Group',
                hintStyle: TextStyle(
                  color: AppColors.font,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
                filled: true,
                fillColor: Color(0xFFF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: [
                DropdownMenuItem(
                  value: 'Home',
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Images/homeicon.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text('Home', style: TextStyle(
                color: AppColors.font,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Personal', 
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Images/person.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text('Personal', style: TextStyle(
                color: AppColors.font,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'Work',
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Images/workicon.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text('Work', style: TextStyle(
                color: AppColors.font,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {},
            ),

            SizedBox(height: 16),

            TextField(
              controller: _endTimeController,
              style: TextStyle(
                color: AppColors.font,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              readOnly: true,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (selectedDate == null) return;

                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (selectedTime == null) return;

                setState(() {
                  _endTimeController.text =
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year} '
                      '${selectedTime.format(context)}';
                });
              },
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    'assets/Images/calendar.png',
                    width: 20,
                    height: 20,
                    color: AppColors.primary,
                  ),
                ),
                hintText: 'End Time',
                hintStyle: TextStyle(
                  color: AppColors.font,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
                filled: true,
                fillColor: const Color(0xFFF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 30),

            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF149954).withValues(alpha: 0.80),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
                  "Add Task",
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
    );
  }
}