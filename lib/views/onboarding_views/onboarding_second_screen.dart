import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackishColor,
      width: 1.sw,
      //height: 100.sp,
      alignment: Alignment.topCenter,
      child: ListView(
        padding: EdgeInsets.only(
          top: 40.sp,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 60.sp,
              left: 30.sp,
              right: 22.sp,
            ),
            child: Image.asset(
              'assets/images/Group 1179.png',
              height: 270.sp,
              width: 270.sp,
            ),
          ),
        ],
      ),
    );
  }
}
