import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';

class HeaderDesign extends StatelessWidget {
  const HeaderDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackishColor,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 1.sw/4.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              height: 55.sp,
              width: 55.sp,
              //  color: Colors.yellow,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/Group 1176.png',
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: SizedBox(
              height: 110.sp,
              width: 170.sp,
              //color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 1.sh/50,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      ' BitBorg',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.themeYellowColor,
                        fontSize: 20.sp,
                        letterSpacing: 0.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      '  Check the signal',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.4.sp,
                        wordSpacing: 1.sp,
                        color: AppColors.pureWhiteColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: SizedBox(
              width: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
