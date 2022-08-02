import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/authentication_views/code_verificaiton_screen.dart';
import 'package:bitborg/views/home_views/app_home_views/app_drawer.dart';
import 'package:bitborg/views/home_views/app_home_views/notification_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/cubits/authentication_cubits/selected_country_cubit.dart';
import '../../../controllers/custom_widgets/authentication_helper_texts.dart';
import '../../../controllers/custom_widgets/static_properties.dart';
import '../../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
      child: BlocProvider(
        create: (context) => SelectedCountryCubit(''),
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(),
              children: [
                SizedBox(
                  height: 18.sp,
                ),
                Container(
                  height: 60.sp,
                  color: AppColors.secondBlackishColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 28.sp,
                          ),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: (){
                              StaticProperties.drawerKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              AppIcons.menu,
                              color: AppColors.pureWhiteColor,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.sp,
                              color: AppColors.pureWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:  Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: (){
                              Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: const NotificationScreen(),
                                    direction:
                                    AxisDirection.down),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 50.sp,
                                  width: 55.sp,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    AppIcons.bell,
                                    color: AppColors.pureWhiteColor,
                                    size: 20.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 8.sp,
                                  right: 15.sp,
                                  child: Icon(
                                    AppIcons.circle,
                                    color: AppColors.themeYellowColor,
                                    size: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  height: 45.sp,
                  width: 45.sp,
                  decoration: BoxDecoration(
                    color: AppColors.themeYellowColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    AppIcons.user,
                    color: AppColors.pureWhiteColor,
                    size: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Center(
                  child: Text(
                    'Muzamil Afridi',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.pureWhiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Center(
                  child: Text(
                    'mfkhan816@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.5.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 1.sw / 5.8,
                    right: 1.sw / 5.8,
                  ),
                  child: Container(
                    height: 44.5.sp,
                    decoration: BoxDecoration(
                      color: const Color(0xff343641), //TODO: Color(0xff343641)
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Icon(
                            AppIcons.diamond,
                            color: AppColors.themeYellowColor,
                            size: 20.sp,
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Text(
                            '  Premium User',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: AppColors.themeYellowColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              letterSpacing: -1.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: Divider(
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: 18.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: AuthenticationHelperTexts.text('Full Name'),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Container(
                  height: 44.sp,
                  width: 327.sp,
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: TextFormField(
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
                        size: 25.sp,
                      ),
                      hintText: ' Muzamil Afridi',
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: AuthenticationHelperTexts.text('Country'),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
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
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: BlocBuilder<SelectedCountryCubit, String>(
                    builder: (context, state) {
                      return Container(
                        height: 44.sp,
                        width: 327.sp,
                        padding: EdgeInsets.only(
                          left: 8.sp,
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
                                size: 27.sp,
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
                              child: state == '' ?  Text(
                                'Country',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.sp,
                                  color: AppColors.textFieldTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ) : Text(
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
                ),
                SizedBox(
                  height: 190.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: InkWell(
                    onTap: (){
                      debugPrint(
                        'Save Changes Button was Pressed',
                      );
                    },
                      child: AppButtons.FilledYellowButton(onTopText: 'Save Changes')),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.sp,
                    right: 24.sp,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        CustomPageRoute(
                            child: const CodeVerificationScreen(),
                            direction:
                            AxisDirection.left,
                        ),
                      );
                    },
                      child: AppButtons.FlatYellowButton(onTopText: 'Change Password')),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
