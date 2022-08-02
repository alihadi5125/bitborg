
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';

class OnBoardingTexts {
 static Widget tittle(String tittle) {
   return Text(
     tittle,
     textAlign: TextAlign.center,
     style: TextStyle(
       fontFamily: 'Montserrat',
       fontSize: 22.sp,
       color: AppColors.pureWhiteColor,
       fontWeight: FontWeight.w600,
     ),
   );
 }

 static Widget subTittle(String subTittle){
   return Text(
     subTittle,
     textAlign: TextAlign.center,
     style: TextStyle(
       height: 1.7.sp,
       fontFamily: 'Montserrat',
       fontSize: 14.sp,
       color: AppColors.greyColor,
       fontWeight: FontWeight.w400,
     ),
   );
 }
}