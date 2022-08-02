import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({Key? key}) : super(key: key);

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
              top: 80.sp,
              left: 22.sp,
              right: 22.sp,
            ),
            child: Image.asset(
              'assets/images/Group 1180.png',
              height: 230.sp,
              width: 230.sp,
            ),
          ),
        ],
      ),
    );
  }
}
