import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  const OnBoardingFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackishColor,
      alignment: Alignment.topCenter,
      child: ListView(
        padding: EdgeInsets.only(
          top: 50.sp,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 80.sp,
              left: 22.sp,
              right: 22.sp,
            ),
            child: Image.asset(
              'assets/images/Group 1178.png',
              height: 230.sp,
              width: 230.sp,
            ),
          ),
        ],
      ),
    );
  }
}
