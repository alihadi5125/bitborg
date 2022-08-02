import 'package:bitborg/controllers/cubits/authentication_cubits/conform_password_visibility_cubit.dart';
import 'package:bitborg/controllers/cubits/authentication_cubits/password_visibility_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/custom_widgets/authentication_helper_texts.dart';
import 'package:bitborg/views/authentication_views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/app_icons_icons.dart';
import '../../models/custom_models/color_constraints.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
        child: Scaffold(
          backgroundColor: AppColors.blackishColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blackishColor,
            elevation: 0.0,
            leading: Padding(
              padding: EdgeInsets.only(
                left: 22.sp,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  AppIcons.arrow_left,
                  color: AppColors.pureWhiteColor,
                  size: 14.sp,
                ),
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: 10.sp,
              left: 22.sp,
              right: 22.sp,
            ),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.pureWhiteColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              SizedBox(
                height: 40.sp,
                child: Text(
                  'Below field are required to fill for the\npassword reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              SizedBox(
                height: 25.sp,
              ),
              AuthenticationHelperTexts.text('New Password'),
              SizedBox(
                height: 8.sp,
              ),
              BlocBuilder<PasswordVisibilityCubit, bool>(
                builder: (context, state) {
                  return SizedBox(
                    height: 44.sp,
                    width: 327.sp,
                    child: TextFormField(
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
                          height: 30.sp,
                          child: Icon(
                            AppIcons.passwordlock,
                            color: AppColors.pureWhiteColor,
                            size: 27.sp,
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
                            size: 20.sp,
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
                height: 25.sp,
              ),
              AuthenticationHelperTexts.text('Confirm Password'),
              SizedBox(
                height: 8.sp,
              ),
              BlocProvider(
                create: (context) => ConformPasswordVisibilityCubit(true),
                child: BlocBuilder<ConformPasswordVisibilityCubit, bool>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 44.sp,
                      width: 327.sp,
                      child: TextFormField(
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
                            height: 30.sp,
                            child: Icon(
                              AppIcons.passwordlock,
                              color: AppColors.pureWhiteColor,
                              size: 27.sp,
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
                              size: 20.sp,
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
              ),
              SizedBox(
                height: 45.sp,
              ),
              InkWell(
                onTap: (){
                  debugPrint('Reset Password Button was pressed..');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()),);
                },
                child: AppButtons.FilledYellowButton(
                  onTopText: 'Reset Password',
                ),
              ),
            ],
          ),
        ));
  }
}
