import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/custom_widgets/status_bar_configuration.dart';
import 'package:bitborg/models/custom_models/app_icons_icons.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/authentication_views/header.dart';
import 'package:bitborg/views/authentication_views/sign_up_screen.dart';
import 'package:bitborg/views/home_views/main_pageview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/cubits/authentication_cubits/password_visibility_cubit.dart';
import '../../controllers/cubits/authentication_cubits/selected_country_cubit.dart';
import '../../controllers/custom_widgets/authentication_helper_texts.dart';
import '../../controllers/cubits/login_cubit/login_cubit.dart';
import '../../models/custom_models/color_constraints.dart';
import '../../models/custom_models/custom_page_routes.dart';
import 'code_verificaiton_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedCountryCubit(''),
      child: StatusBarConfiguration.statusBarConfiguration(
          child: Scaffold(
            backgroundColor: AppColors.blackishColor,
            resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blackishColor,
          elevation: 0.0,
          toolbarHeight: 85.sp,
          flexibleSpace: const HeaderDesign(),
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
           shrinkWrap: true,
            padding: EdgeInsets.only(
              top: 10.sp,
              left: 23.sp,
              right: 23.sp,
            ),
            children: [
              Text(
                'LogIn',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.pureWhiteColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 11.sp,
              ),
              Text(
                'Please enter email & password to login',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.greyColor,
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              AuthenticationHelperTexts.text('Email'),
              SizedBox(
                height: 5.sp,
              ),
              SizedBox(
                height: 44.sp,
                width: 327.sp,
                child: TextFormField(
                  controller: email,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.sp,
                    color: AppColors.pureWhiteColor,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.pureWhiteColor,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      AppIcons.email,
                      color: AppColors.pureWhiteColor,
                      size: 20.sp,
                    ),
                    hintText: 'hellojohn@gmail.com',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.sp,
                      color: AppColors.textFieldTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: AppColors.textFieldFillColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        5.0.sp,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              AuthenticationHelperTexts.text('Password'),
              SizedBox(
                height: 5.sp,
              ),
              BlocBuilder<PasswordVisibilityCubit, bool>(
                builder: (context, state) {
                  return SizedBox(
                    height: 44.sp,
                    width: 327.sp,
                    child: TextFormField(
                      controller: password,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.sp,
                        color: AppColors.pureWhiteColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: AppColors.pureWhiteColor,
                      textInputAction: TextInputAction.done,
                      obscureText: state ? false : true,
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          height: 20.sp,
                          child: Icon(
                            AppIcons.passwordlock,
                            color: AppColors.pureWhiteColor,
                            size: 20.sp,
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            if (state == false) {
                              context
                                  .read<PasswordVisibilityCubit>()
                                  .passwordVisibility(visibility: true);
                            } else {
                              context
                                  .read<PasswordVisibilityCubit>()
                                  .passwordVisibility(visibility: false);
                            }
                          },
                          child: Icon(
                            AppIcons.passwordeye,
                            color: state
                                ? AppColors.pureWhiteColor
                                : AppColors.textFieldTextColor,
                            size: 15.sp,
                          ),
                        ),
                        hintText: '*********',
                        hintStyle: TextStyle(
                          height: 1.8.sp,
                          fontFamily: 'Montserrat',
                          fontSize: 18.sp,
                          color: AppColors.textFieldTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                        filled: true,
                        fillColor: AppColors.textFieldFillColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            5.0.sp,
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 8.sp,
              ),
              InkWell(
                onTap: () {
                  debugPrint('Forgot Password Button was pressed...');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CodeVerificationScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 40.sp,
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password ?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.themeYellowColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.sp,
              ),
              InkWell(
                onTap: () {
                  SharedPrefs.prefs!.setString("email", email.text.trim());
                  context.read<LoginApiCubit>().login(email: email.text, password: password.text,
                  context: context
                  );
                },
                child: AppButtons.FilledYellowButton(
                  onTopText: 'Log In',
                ),
              ),
              SizedBox(
                height: 200.sp,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account ?',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.greyColor,
                      letterSpacing: -1.sp,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              CustomPageRoute(
                                child:  SignUpScreen(),
                                direction: AxisDirection.left,
                              ),
                            );
                          },
                        text: ' Create Account',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.themeYellowColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      ),
    );
  }
}
