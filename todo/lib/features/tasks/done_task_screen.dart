
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:todo/core/utils/apps_assets.dart'; 
import 'package:todo/core/utils/apps_colors.dart'; 
 
 
class DoneTaskScreen extends StatefulWidget { 
  const DoneTaskScreen({Key? key}) : super(key: key); 
 
  @override 
  State<DoneTaskScreen> createState() => _DoneTaskScreenState(); 
} 
 
class _DoneTaskScreenState extends State<DoneTaskScreen> { 
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
                'Done Task', 
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
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [ 
                const SizedBox(height: 16), 
                Row( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [ 
                    Container( 
                      width: 60.w, 
                      height: 60.h, 
                      decoration: const BoxDecoration( 
                        shape: BoxShape.circle, 
                        image: DecorationImage( 
                          image: AssetImage('assets/Images/flag.png'), 
                          fit: BoxFit.cover, 
                        ), 
                      ), 
                    ), 
                    const SizedBox(width: 14), 
                    Expanded( 
                      child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: const [ 
                          Text( 
                            'Done', 
                            style: TextStyle( 
                              fontSize: 14, 
                              fontWeight: FontWeight.w300, 
                            ), 
                          ), 
                          SizedBox(height: 4), 
                          Text( 
                            'Congrats!', 
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
                            AppImages.homeIcon, 
                            width: 20.w, 
                            height: 20.h, 
                          ), 
                          SizedBox(width: 10), 
                          Text( 
                            'Home', 
                            style: TextStyle( 
                              color: AppColors.font, 
                              fontSize: 14, 
                              fontWeight: FontWeight.w300, 
                            ), 
                          ), 
                        ], 
                      ), 
                    ), 
                    DropdownMenuItem( 
                      value: 'Personal', 
                      child: Row( 
                        children: [ 
                          Image.asset( 
                            AppImages.person, 
                            width: 20.w, 
                            height: 20.h, 
                          ), 
                          SizedBox(width: 10), 
                          Text( 
                            'Personal', 
                            style: TextStyle( 
                              color: AppColors.font, 
                              fontSize: 14, 
                              fontWeight: FontWeight.w300, 
                            ), 
                          ), 
                        ], 
                      ), 
                    ), 
                    DropdownMenuItem( 
                      value: 'Work', 
                      child: Row( 
                        children: [ 
                          Image.asset( 
                            AppImages.workIcon, 
                            width: 20.w, 
                            height: 20.h, 
                          ), 
                          SizedBox(width: 10), 
                          Text( 
                            'Work', 
                            style: TextStyle( 
                              color: AppColors.font, 
                              fontSize: 14, 
                              fontWeight: FontWeight.w300, 
                            ), 
                          ), 
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
                    Image.asset(AppImages.calender), 
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
          ), 
        ), 
      ), 
    ); 
  } 
}

