import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Task', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          children: [
            SizedBox(
              height: 207,
              width: 261,
              child: Image.asset('assets/Images/flag.png', fit: BoxFit.cover,)
            ),

            SizedBox(height: 20),

            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                filled: true,
                fillColor: Color(0xFFF4F6F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                filled: true,
                fillColor: Color(0xFFF4F6F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 16),

            DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: 'Group',
                filled: true,
                fillColor: Color(0xFFF4F6F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              items: [
                DropdownMenuItem(value: 'Home', child: Text('Home')),
                DropdownMenuItem(value: 'Personal', child: Text('Personal')),
                DropdownMenuItem(value: 'Work', child: Text('Work')),
              ],
              onChanged: (value) {},
            ),

            SizedBox(height: 16),

            TextField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
              decoration: InputDecoration(
                hintText: 'End Time',
                prefixIcon: Icon(Icons.calendar_today_outlined, size: 18),
                filled: true,
                fillColor: Color(0xFFF4F6F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2FBFA0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Add Task', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}