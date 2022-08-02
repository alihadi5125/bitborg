
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';

class AuthenticationHelperTexts {
  static Widget text(String text) {
    return Container(
      height: 18.sp,
      width: 73.sp,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: AppColors.pureWhiteColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}