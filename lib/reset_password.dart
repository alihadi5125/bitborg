import 'package:bitborg/controllers/custom_widgets/authentication_helper_texts.dart';
import 'package:bitborg/models/custom_models/app_icons_icons.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/views/verification_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBlackishColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondBlackishColor,
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
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.sp,
            color: AppColors.pureWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [

        ],
      ),
      body: Container(
        child: ListView(
          children: [
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

        Container(
          //alignment: Alignment(0.0,-0.09),
          width: 307.0.sp,
          height: 50.0.sp,
          decoration: BoxDecoration(
            color: AppColors.blackishColor,
            borderRadius: BorderRadius.circular(
              5.0.sp,
            ),
            border: Border.all(
              width: 1.0,
              color: AppColors.themeYellowColor,
            ),
          ),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:
                  (context)=>VerificationScreen(email: email.text))
              );
            },
            child: Center(
              child:
               Text(
                "Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.sp,
                  color: AppColors.themeYellowColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
          ],
        ),

      )
    );
  }
}
