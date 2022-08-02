import 'package:bitborg/controllers/cubits/resend_code_cubit.dart';
import 'package:bitborg/controllers/cubits/verify_mail/verfy_email_cubit.dart';
import 'package:bitborg/controllers/cubits/verify_otp/verify_otp_cubit.dart';
import 'package:bitborg/models/custom_models/app_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:snack/snack.dart';


import '../models/custom_models/color_constraints.dart';


class VerificationScreen extends StatefulWidget {
  String email;

  VerificationScreen({required this.email});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  late TimerController _timerController;


  @override
  void initState() {
    _timerController = TimerController(this);
    _timerController.duration = Duration(seconds: 120);
    _timerController.start();
    context.read<ResendCodeCubit>().resend(value: true);
    super.initState();
  }


  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: const Color(0xff2A2C39),
      border: Border.all(color: Colors.deepPurpleAccent.withOpacity(.3)),
      borderRadius: BorderRadius.circular(4.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111422),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: ListView(
          padding: EdgeInsets.only(left: 25.sp, right: 25.sp, top: 40.sp),
          children: [
            SizedBox(
              height: 30.sp,
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    AppIcons.arrow_left,
                    color: Colors.white,
                    size: 12.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Center(
              child: Text(
                'Verification Code',
                style: GoogleFonts.montserrat(
                  fontSize: 24.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.montserrat(
                  fontSize: 14.0.sp,
                  color: AppColors.textFieldTextColor,
                  height: 1.71.sp,
                ),
                children: [
                  TextSpan(
                    text: 'Enter the ',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: '4 digit ',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' code that we have sent to you\nthrough email ',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: widget.email,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.sp,
            ),
            PinPut(

              withCursor: false,
              enableInteractiveSelection: false,
              textStyle: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: AppColors.textFieldTextColor,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              fieldsAlignment: MainAxisAlignment.spaceEvenly,
              fieldsCount: 4,
              onSubmit: (String pin) => _showSnackBar(pin, context),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(4.0.sp),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0.sp),
                color: const Color(0xff2A2C39),
              ),
            ),
            SizedBox(height: 10.0.sp),
            Row(
              children: [
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 60,
                        child: SimpleTimer(
                          progressTextCountDirection: TimerProgressTextCountDirection
                              .count_down,
                          progressIndicatorDirection: TimerProgressIndicatorDirection
                              .clockwise,
                          delay: Duration(seconds: 0),
                          progressTextStyle: TextStyle(
                              color: Colors.white
                          ),
                          timerStyle: TimerStyle.expanding_sector,
                          displayProgressIndicator: false,

                          controller: _timerController,
                          strokeWidth: 10,
                          startAngle: 12,

                          duration: _timerController.duration!,
                          onEnd: () {
                            context.read<ResendCodeCubit>().resend(
                                value: false);
                          },
                        ),
                      ),
                    )
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 32.sp),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: BlocBuilder<ResendCodeCubit, bool>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              if (!state) {
                                context.read<VerfyEmailCubit>()
                                    .verifyEmail(
                                    email: widget.email, context: context)
                                    .whenComplete(() {
                                  context.read<ResendCodeCubit>().resend(
                                      value: true);
                                  _timerController.reset();
                                  _timerController.start();
                                });
                              }
                            },
                            child: Text(
                              'Resend Code',
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0.sp,
                                color: !state
                                    ? AppColors.themeYellowColor
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                                height: 1.71.sp,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )

              ],
            ),

            SizedBox(
              height: 50.sp,
            ),
            BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    if(_pinPutController.text.isEmpty){
                      SnackBar(
                          backgroundColor: AppColors.themeYellowColor,
                          content: Text('Please Enter Otp')).show(context);
                    }
                    else{
                      if(_pinPutController.text.length<4){
                        SnackBar(
                            backgroundColor: AppColors.themeYellowColor,
                            content: Text('Otp Should be 4 Digits')).show(context);
                      }
                      else{
                       if(state is VerifyOtpLoading){

                       }
                       else{
                         context.read<VerifyOtpCubit>().verifyOtp(otp: _pinPutController.text.trim(), context: context, email: widget.email);
                       }
                      }
                    }



                    ///  print("ali");
                    ///  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigationScreen()));
                  },
                  child: Container(
                    width: 327.0,
                    height: 44.0.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0.sp),
                        color: AppColors.themeYellowColor
                    ),
                    child: Center(
                      child: state is VerifyOtpLoading?CircularProgressIndicator(
                        color: Colors.white,

                      ):Text(
                        'Continue',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}
