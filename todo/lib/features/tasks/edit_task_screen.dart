import 'package:flutter/material.dart'; 
import 'package:todo/core/utils/apps_colors.dart'; 
import 'package:todo/features/tasks/done_task_screen.dart'; 
 
class EditTaskScreen extends StatefulWidget { 
  const EditTaskScreen({Key? key}) : super(key: key); 
 
  @override 
  State<EditTaskScreen> createState() => _EditTaskScreenState(); 
} 
 
class _EditTaskScreenState extends State<EditTaskScreen> { 
  final TextEditingController _titleController = TextEditingController(); 
  final TextEditingController _descriptionController = TextEditingController(); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: AppColors.background, 
      appBar: AppBar( 
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        leading: IconButton( 
          icon: const Icon(Icons.arrow_back), 
          onPressed: () { 
            Navigator.of(context).maybePop(); 
          }, 
        ), 
        title: Row( 
          children: [ 
            const Spacer(), 
            const Center( 
              child: Text( 
                'Edit Task', 
                style: TextStyle( 
                  fontSize: 19, 
                  fontWeight: FontWeight.w300, 
                ), 
              ), 
            ), 
            const Spacer(), 
            Container( 
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0), 
              decoration: BoxDecoration( 
                color: const Color(0xFFDC2626), 
                borderRadius: BorderRadius.circular(20.0), 
              ), 
              child: Row( 
                mainAxisSize: MainAxisSize.min, 
                children: const [ 
                  Icon( 
                    Icons.delete_outline, 
                    color: Colors.white, 
                    size: 18.0, 
                  ), 
                  SizedBox(width: 4.0), 
                  Text( 
                    'Delete', 
                    style: TextStyle( 
                      color: Colors.white, 
                      fontSize: 14.0, 
                      fontWeight: FontWeight.w500, 
                    ), 
                  ), 
                ], 
              ), 
            ), 
          ], 
        ), 
      ), 
      body: SafeArea( 
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 20.0), 
          child: SingleChildScrollView( 
            physics: const BouncingScrollPhysics(), 
            child: Column( 
              children: [ 
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [ 
                    const SizedBox(height: 16), 
                    Row( 
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [ 
                        Container( 
                          width: 60, 
                          height: 60, 
                          decoration: const BoxDecoration( 
                            shape: BoxShape.circle, 
                            image: DecorationImage(image: AssetImage('assets/Images/flag.png'), fit: BoxFit.cover) 
                          ), 
                        ), 
                        const SizedBox(width: 14), 
                        Expanded( 
                          child: Column( 
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: const [ 
                              Text( 
                                'In Progress', 
                                style: TextStyle( 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w300, 
                                ), 
                              ), 
                              SizedBox(height: 4), 
                              Text( 
                                'Believe you can, and you\'re halfway there.', 
                                style: TextStyle( 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w300, 
                                ), 
                              ), 
                            ], 
                          ), 
                        ), 
                      ], 
                    ), 
                    const SizedBox(height: 24), 
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
                    const SizedBox(height: 20), 
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
                      maxLines: 5, 
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
                    SizedBox(height: 20), 
                    Row( 
                      children: [ 
                        Image.asset('assets/Images/calendar.png'), 
                        const SizedBox(width: 8), 
                        const Text( 
                          '30 June, 2022  10:00 pm', 
                          style: TextStyle( 
                            fontSize: 13, 
                            color: Colors.black54, 
                            fontWeight: FontWeight.w500, 
                          ), 
                        ), 
                      ], 
                    ), 
                    const SizedBox(height: 10), 
                  ], 
                ), 
                Column( 
                  children: [ 
                    GestureDetector( 
                      onTap: () { 
                        Navigator.push( 
                          context, 
                          MaterialPageRoute( 
                            builder: (context) => DoneTaskScreen(),  
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
                          "Mark As Done", 
                          style: TextStyle( 
                            color: Colors.white, 
                            fontSize: 19, 
                            fontWeight: FontWeight.w300, 
                          ), 
                        ), 
                      ), 
                    ), 
                    SizedBox(height: 15), 
                    GestureDetector( 
                      onTap: () { 
                        Navigator.push( 
                          context, 
                          MaterialPageRoute( 
                            builder: (context) => EditTaskScreen(),  
                          ), 
                        ); 
                      }, 
                      child: Container( 
                        width: double.infinity, 
                        height: 56, 
                        alignment: Alignment.center, 
                        decoration: BoxDecoration( 
                          color: AppColors.background, 
                          borderRadius: BorderRadius.circular(14), 
                          border: Border.all(color: AppColors.primary), 
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
                          "Updated", 
                          style: TextStyle( 
                            color: AppColors.primary, 
                            fontSize: 19, 
                            fontWeight: FontWeight.w300, 
                          ), 
                        ), 
                      ), 
                    ), 
                  ], 
                ), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}