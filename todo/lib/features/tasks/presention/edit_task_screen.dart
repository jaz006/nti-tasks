
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:todo/core/utils/apps_assets.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';
import 'package:todo/features/tasks/data/repo/delete_task_repo.dart';
import 'package:todo/features/tasks/data/repo/edit_task_repo.dart';
import 'package:todo/features/tasks/presention/done_task_screen.dart';

class EditTaskScreen extends StatefulWidget {
  final Map task;

  const EditTaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _descriptionController =
      TextEditingController();

  String? selectedGroup;

  bool isLoading = false;
  bool isDeleting = false;

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.task['title'] ?? '';
    _descriptionController.text =
        widget.task['description'] ?? '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // =========================
  // UPDATE TASK
  // =========================

  Future<void> updateTask() async {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter title and description',
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      TaskModel task = TaskModel(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
      );

      EditTaskRepo repo = EditTaskRepo();

      var result = await repo.editTask(
        id: widget.task['id'],
        task: task,
      );

      result.fold(
        (errorMsg) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMsg,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
        },
        (msg) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                msg,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color.fromARGB(
                255,
                51,
                148,
                55,
              ),
            ),
          );

          Navigator.pop(context);
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // =========================
  // DELETE TASK
  // =========================

  Future<void> deleteTask() async {
    setState(() {
      isDeleting = true;
    });

    try {
      DeleteTaskRepo repo = DeleteTaskRepo();

      var result = await repo.deleteTask(
        id: widget.task['id'],
      );

      result.fold(
        (errorMsg) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMsg,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
        },
        (msg) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                msg,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color.fromARGB(
                255,
                51,
                148,
                55,
              ),
            ),
          );

          Navigator.pop(context);
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          isDeleting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // =========================
      // APP BAR
      // =========================

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
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
            GestureDetector(
              onTap: isDeleting ? null : deleteTask,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDC2626),
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isDeleting)
                      const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    else
                      const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Text(
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
            ),
          ],
        ),
      ),

      // =========================
      // BODY
      // =========================

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/Images/flag.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
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

                    // =========================
                    // GROUP
                    // =========================

                    DropdownButtonFormField<String>(
                      value: selectedGroup,
                      decoration: InputDecoration(
                        hintText: 'Group',
                        hintStyle: TextStyle(
                          color: AppColors.font,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                        filled: true,
                        fillColor:
                            const Color(0xFFF7F7F9),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12.r),
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
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: AppColors.font,
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w300,
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
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Personal',
                                style: TextStyle(
                                  color: AppColors.font,
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w300,
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
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Work',
                                style: TextStyle(
                                  color: AppColors.font,
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedGroup = value;
                        });
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // =========================
                    // TITLE
                    // =========================

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
                        fillColor:
                            const Color(0xFFF7F7F9),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    // =========================
                    // DESCRIPTION
                    // =========================

                    TextField(
                      controller:
                          _descriptionController,
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
                        fillColor:
                            const Color(0xFFF7F7F9),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // =========================
                    // DATE
                    // =========================

                    Row(
                      children: [
                        Image.asset(
                          AppImages.calender,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
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

                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),

                // =========================
                // BUTTONS
                // =========================

                Column(
                  children: [
                    // =========================
                    // MARK AS DONE
                    // =========================

                    GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DoneTaskScreen(),
                                ),
                              );
                            },
                      child: Container(
                        width: double.infinity,
                        height: 56.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(14.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF149954,
                              ).withValues(
                                alpha: 0.80,
                              ),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(
                                0,
                                5,
                              ),
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

                    const SizedBox(
                      height: 15,
                    ),

                    // =========================
                    // UPDATE
                    // =========================

                    GestureDetector(
                      onTap: isLoading
                          ? null
                          : updateTask,
                      child: Container(
                        width: double.infinity,
                        height: 56.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius:
                              BorderRadius.circular(14.r),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF149954,
                              ).withValues(
                                alpha: 0.80,
                              ),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(
                                0,
                                5,
                              ),
                            ),
                          ],
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child:
                                    CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color:
                                      AppColors.primary,
                                ),
                              )
                            : const Text(
                                "Updated",
                                style: TextStyle(
                                  color:
                                      AppColors.primary,
                                  fontSize: 19,
                                  fontWeight:
                                      FontWeight.w300,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

