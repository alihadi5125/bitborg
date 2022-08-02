import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/views/authentication_views/new_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/app_icons_icons.dart';
import '../../models/custom_models/color_constraints.dart';
import '../../models/custom_models/custom_page_routes.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

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
            child: SizedBox(
              height: 29.sp,
              width: 214.sp,
              child: Text(
                'Verification Code',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.pureWhiteColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          SizedBox(
            height: 60.sp,
            width: 324.sp,
            child: Text(
              'Enter the 4 digit code that we have sent to you\nthrough email mfkhan816@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.sp,
                color: AppColors.greyColor,
              ),
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 45.sp,
                  width: 45.sp,
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.pureWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorHeight: 0.0.sp,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: AppColors.textFieldFillColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 5.sp,
                        bottom: 5.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        // borderSide: BorderSide(
                        //   color: AppColors.greenColor,
                        //   width: 2.0.sp,
                        // ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.sp),
                          topLeft: Radius.circular(10.sp),
                          bottomLeft: Radius.circular(10.sp),
                          bottomRight: Radius.circular(10.sp),
                        ),
                      ),
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 22.sp,
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 45.sp,
                  width: 45.sp,
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.pureWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorHeight: 0.0.sp,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: AppColors.textFieldFillColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 5.sp,
                        bottom: 5.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.sp),
                          topLeft: Radius.circular(10.sp),
                          bottomLeft: Radius.circular(10.sp),
                          bottomRight: Radius.circular(10.sp),
                        ),
                      ),
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 22.sp,
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 45.sp,
                  width: 45.sp,
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.pureWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorHeight: 0.0.sp,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: AppColors.textFieldFillColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 5.sp,
                        bottom: 5.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.sp),
                          topLeft: Radius.circular(10.sp),
                          bottomLeft: Radius.circular(10.sp),
                          bottomRight: Radius.circular(10.sp),
                        ),
                      ),
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 22.sp,
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 45.sp,
                  width: 45.sp,
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.pureWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorHeight: 0.0.sp,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: AppColors.textFieldFillColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 5.sp,
                        bottom: 5.sp,
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.sp),
                          topLeft: Radius.circular(10.sp),
                          bottomLeft: Radius.circular(10.sp),
                          bottomRight: Radius.circular(10.sp),
                        ),
                      ),
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.sp,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 50.sp,
              right: 50.sp,
          ),
            child: SizedBox(
              height: 30.sp,
              child:
                  // TODO: code verified
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 1,
                  //       child: SizedBox(),
                  //     ),
                  //     Expanded(
                  //       flex: 0,
                  //       child: Icon(
                  //         AppIcons.shield,
                  //         color: AppColors.greenColor,
                  //       ),
                  //     ),
                  //     Expanded(
                  //           flex: 0,
                  //           child: SizedBox(
                  //             width: 10.sp,
                  //           ),
                  //         ),
                  //     Expanded(
                  //       flex: 0,
                  //       child: Text(
                  //         'Code is Verrified',
                  //         style: TextStyle(
                  //           fontFamily: 'Montserrat',
                  //           color: AppColors.greenColor,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ) // TODO: code not verified / initial
                  // TODO: code not verified / initial
                  Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Icon(
                      AppIcons.clock,
                      color: AppColors.greyColor,
                      size: 20.sp,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 10.sp,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '00:10',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.themeYellowColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.sp,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(
                  child: const NewPasswordScreen(),
                  direction: AxisDirection.left,
                ),
              );
            },
            child: Container(
              color: AppColors.blackishColor,
              child: Container(
                height: 50.0.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.0.sp,
                  ),
                  color: AppColors.themeYellowColor, // TODO: code verified
                  //color: AppColors.textFieldFillColor, ////color: AppColors.greyColor, // TODO: code not verified / initial
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.sp,
                      //color: AppColors.greyColor, // TODO: code not verified / initial
                      color: AppColors.pureWhiteColor,
                      // TODO: code verified
                      // fontWeight: FontWeight.w500, // TODO: code not verified / initial
                      fontWeight: FontWeight.w600, // TODO: code verified
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
