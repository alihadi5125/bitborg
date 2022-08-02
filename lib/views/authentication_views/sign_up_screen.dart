import 'package:bitborg/controllers/cubits/authentication_cubits/password_visibility_cubit.dart';
import 'package:bitborg/controllers/cubits/authentication_cubits/selected_country_cubit.dart';
import 'package:bitborg/controllers/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/authentication_helper_texts.dart';
import 'package:bitborg/controllers/custom_widgets/static_properties.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/authentication_views/login_screen.dart';
import 'package:bitborg/views/authentication_views/risk_attached.dart';
import 'package:bitborg/views/authentication_views/terms_and_conditions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart';
import 'package:snack/snack.dart';

import '../../controllers/custom_widgets/app_buttons.dart';
import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/app_icons_icons.dart';
import '../../models/custom_models/color_constraints.dart';
import '../../models/custom_models/custom_page_routes.dart';
import 'header.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedCountryCubit(''),
      child: StatusBarConfiguration.statusBarConfiguration(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.blackishColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blackishColor,
            elevation: 0.0,
            toolbarHeight: 80.sp,
            flexibleSpace: const HeaderDesign(),
          ),
          body: Container(
            height: 1.sh,
            width: 1.sw,
            color: AppColors.blackishColor,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: 4.sp,
                  left: 24.sp,
                  right: 24.sp,
                ),
                children: [
                  SizedBox(
                    height: 29.sp,
                    width: 192.sp,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.pureWhiteColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.sp,
                  ),
                  SizedBox(
                    height: 42.sp,
                    width: 303.sp,
                    child: Text(
                      'Please enter below information for account creation.',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.greyColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  AuthenticationHelperTexts.text('Full Name'),
                  SizedBox(
                    height: 5.sp,
                  ),
                  SizedBox(
                    height: 44.sp,
                    width: 327.sp,
                    child: TextFormField(
                      controller: fullName,
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
                          AppIcons.user,
                          color: AppColors.pureWhiteColor,
                          size: 20.sp,
                        ),
                        hintText: 'Full Name',
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
                    height: 18.sp,
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
                        hintText: 'Email',
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
                    height: 18.sp,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AuthenticationHelperTexts.text('Country'),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 15.sp,
                          width: 63.sp,
                          child: Text(
                            '(Optional)',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: AppColors.optionalTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  BlocBuilder<SelectedCountryCubit, String>(
                    builder: (context, state) {
                      return Container(
                        height: 44.sp,
                        width: 327.sp,
                        padding: EdgeInsets.only(
                          left: 12.sp,
                          right: 12.sp,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldFillColor,
                          borderRadius: BorderRadius.circular(5.0.sp),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: Icon(
                                AppIcons.globe,
                                color: AppColors.pureWhiteColor,
                                size: 20.sp,
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: SizedBox(
                                width: 12.sp,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: state == ''
                                  ? Text(
                                      'Country',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.sp,
                                        color: AppColors.textFieldTextColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      StaticProperties.selectedCountry,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.sp,
                                        color: AppColors.pureWhiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: false,
                                  countryListTheme: CountryListThemeData(
                                      flagSize: 25.sp,
                                      backgroundColor: AppColors.blackishColor,
                                      inputDecoration: InputDecoration(
                                        focusColor: AppColors.themeYellowColor,
                                        contentPadding: EdgeInsets.all(10.sp),
                                        filled: true,
                                        fillColor: Colors.white30,
                                        icon: Image.asset(
                                          'assets/images/Group 1176.png',
                                          height: 50.sp,
                                          width: 50.sp,
                                        ),
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greyColor,
                                          fontSize: 12.sp,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: AppColors.pureWhiteColor,
                                          size: 25.sp,
                                        ),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      textStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: AppColors.pureWhiteColor,
                                      )),
                                  onSelect: (Country country) {
                                    LoginController.country =
                                        country.countryCode;
                                    StaticProperties.selectedCountry =
                                        country.name.trim();
                                    context
                                        .read<SelectedCountryCubit>()
                                        .selectedCountry(
                                            selectedCountry: country.name);
                                  },
                                );
                              },
                              child: Icon(
                                AppIcons.keyboard_arrow_down,
                                color: AppColors.pureWhiteColor,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 18.sp,
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
                            prefixIcon: SizedBox(
                              height: 30.sp,
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
                    height: 30.sp,
                  ),
                  const TermsAndConditions(),
                  SizedBox(
                    height: 10.sp,
                  ),
                  const RisksAttached(),
                  SizedBox(
                    height: 15.sp,
                  ),
                  InkWell(onTap: () {
                    if (EmailValidator.validate(email.text)) {
                      if (email.text.trim().isEmpty ||
                          password.text.trim().isEmpty ||
                          fullName.text.trim().isEmpty) {
                        SnackBar(
                                backgroundColor: AppColors.themeYellowColor,
                                content: Text(
                                    'Full Name, Email and Password are Mandatory'))
                            .show(context);
                      } else {
                        if (password.text.length < 8) {
                          SnackBar(
                                  backgroundColor: AppColors.themeYellowColor,
                                  content: Text(
                                      'Password should be at-least 8 characters'))
                              .show(context);
                        } else {
                          context.read<SignUpCubit>().login(
                              fullName: fullName.text,
                              country: LoginController.country,
                              email: email.text,
                              password: password.text,
                              context: context);

                          /// cubit call here
                        }
                      }
                    } else {
                      SnackBar(
                              backgroundColor: AppColors.themeYellowColor,
                              content: Text('Invalid Email Format'))
                          .show(context);
                    }
                    // Navigator.push(
                    //   context,
                    //   CustomPageRoute(
                    //       child:  LoginScreen(),
                    //       direction:
                    //       AxisDirection.right),
                    // );
                  }, child: BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return Container(
                        color: AppColors.blackishColor,
                        child: Container(
                          height: 50.0.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.0.sp,
                            ),
                            color: AppColors.themeYellowColor,
                          ),
                          child: Center(
                            child: state is SignUpLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Create Account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.sp,
                                      color: AppColors.pureWhiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  )),
                  SizedBox(
                    height: 70.sp,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.greyColor,
                          letterSpacing: -1.sp,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        text: 'Already have an Account ?',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  CustomPageRoute(
                                    child: LoginScreen(),
                                    direction: AxisDirection.right,
                                  ),
                                );
                              },
                            text: ' Log In',
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
          ),
        ),
      ),
    );
  }
}

class LoginController {
  static String country = "";
  static bool check1 = false;
  static bool check2 = false;
}
