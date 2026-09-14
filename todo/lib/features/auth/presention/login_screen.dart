import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:todo/core/components/custom_widgets/custom_btn.dart';
import 'package:todo/core/components/custom_widgets/custom_text_field.dart';
import 'package:todo/core/helper/app_navigation.dart';
import 'package:todo/core/utils/app_padding.dart';
import 'package:todo/core/utils/apps_assets.dart';
import 'package:todo/core/utils/apps_colors.dart';
import 'package:todo/features/auth/data/repo/auth_repo.dart';
import 'package:todo/features/auth/presention/register_screen.dart';
import 'package:todo/features/home/presention/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordSecure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
              child: Image.asset(
                AppImages.flag,
                width: double.infinity,
                height: 293.h,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                children: [
                  SizedBox(height: 23.h),
                  CustomTextField(
                    controller: usernameController,
                    hint: 'Username',
                    prefixIconPath: AppSvgs.profile,
                  ),

                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'Password',
                    prefixIconPath: AppSvgs.password,
                    suffixIconPath: isPasswordSecure
                        ? AppSvgs.unlock
                        : AppSvgs.unlock,
                    onSuffixPressed: () {
                      setState(() {
                        isPasswordSecure = !isPasswordSecure;
                      });
                    },
                    obscureText: isPasswordSecure,
                  ),

                  SizedBox(height: 23.h),
                  if (!isLoading)
                    CustomBtn(
                      text: 'Login',
                      onPressed: () async {
                        AuthRepo repo = AuthRepo();
                        setState(() {
                          isLoading = true;
                        });
                        var result = await repo.login(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                        result.fold(
                          // left
                              (errorMsg) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                errorMsg,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                          // right
                                (userData){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Welcome ${userData.username}',
                                  style: TextStyle(color: Colors.white),),
                                  backgroundColor: AppColors.primary,)
                                );
                                MyNavigator.goTo(context, toPage: HomeScreen(),
                                type: NavigatorType.pushAndRemoveUntil);
                            }

                        );
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  if (isLoading) CircularProgressIndicator(),

                  SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t Have An Account?", style: TextStyle(
                        color: AppColors.font,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w200
                      ),),
                      SizedBox(width: 15,),
                      TextButton(onPressed: ()=> MyNavigator.goTo(context, toPage: RegisterScreen()),
                          child: Text('Register', style: TextStyle(
                            color: AppColors.font,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400
                          ),))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}