import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:todo/core/components/custom_widgets/custom_svg.dart';
import 'package:todo/core/helper/app_navigation.dart';
import 'package:todo/core/utils/app_padding.dart';
import 'package:todo/core/utils/apps_assets.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/home/data/repo/home_repo.dart';
import 'package:todo/features/profile/profile_screen.dart';
import 'package:todo/features/tasks/presention/add_task_screen.dart';
import 'package:todo/features/tasks/presention/edit_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  String? errorMsg;
  List? tasks;
  getTasks() async {
    setState(() {
      errorMsg = null;
      tasks = null;
      isLoading = true;
    });
    HomeRepo repo = HomeRepo();
    var result = await repo.getTasks();
    result.fold(
      (String e) {
        setState(() {
          errorMsg = e;
        });
      },
      (List t) {
        setState(() {
          tasks = t;
        });
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                MyNavigator.goTo(context, toPage: ProfileScreen());
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(AppImages.flag),
                radius: 30.r,
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    color: AppColors.font,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    color: AppColors.font,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: isLoading
            ? CircularProgressIndicator()
            : errorMsg != null
            ? Center(child: Text(errorMsg!))
            : tasks != null && tasks?.isNotEmpty == true
            ? Column(
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Text(
                        'Tasks',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.font,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        padding: REdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '${tasks?.length}',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () async {
                          await MyNavigator.goTo(
                            context,
                            toPage: EditTaskScreen(task: tasks![index]),
                          );
                          getTasks();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.primary.withValues(alpha: 0.25),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4.r,
                                spreadRadius: 0,
                                color: Colors.black.withValues(alpha: 0.25),
                              ),
                            ],
                          ),
                          padding: REdgeInsets.all(13),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tasks![index]['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: AppColors.hintfont,
                                      ),
                                    ),
                                    SizedBox(height: 13.h),
                                    Text(
                                      tasks![index]['description'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.sp,
                                        color: AppColors.font,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                tasks![index]['created_at'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.hintfont,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemCount: tasks!.length,
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'There are no tasks yet,\nPress the button\nTo add New Task ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.font,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60.h),
                    CustomSvg(
                      path: AppSvgs.emtyhome,
                      width: 300.w,
                      height: 225.h,
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await MyNavigator.goTo(context, toPage: AddTaskScreen());
          getTasks();
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        child: CustomSvg(path: AppSvgs.paperPlus),
      ),
    );
  }
}
