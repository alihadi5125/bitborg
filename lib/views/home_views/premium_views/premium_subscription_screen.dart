import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/custom_widgets/static_properties.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../../../models/custom_models/remove_scrollglow.dart';
import '../app_home_views/notification_screen.dart';

class PremiumSubscriptionScreen extends StatelessWidget {
  const PremiumSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 85.sp,
            decoration: BoxDecoration(
                color: AppColors.secondBlackishColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.sp,
                    spreadRadius: 5.sp,
                  ),
                ]),
            padding: EdgeInsets.only(
              top: 25.sp,

            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 25.sp,
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
                  flex: 5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Subscription',
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
            height: 30.sp,
          ),
          SizedBox(
            height: 135.sp,
            child: Image.asset(
              'assets/images/Group 1189.png',
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          SizedBox(
            height: 22.sp,
            child: Text(
              'Unlock Premium Features',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColors.themeYellowColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            )
          ),
          SizedBox(
            height: 5.sp,
          ),
          SizedBox(
              height: 44.sp,
              child: Text(
                'You can buy any premium subscription and\nenjoy Unlimited features of the app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w400,
                  height: 1.5.sp,
                  fontSize: 14.sp,
                ),
              )
          ),
          SizedBox(
            height: 20.sp,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.sp,
              right: 25.sp,
            ),
            child: AppButtons.PremiumPackagesButton(
                planText: 'Yearly Plan',
                package: '\$ 30.00 / Month',
            ),
          ),
          SizedBox(
            height: 16.sp,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.sp,
              right: 25.sp,
            ),
            child: AppButtons.PremiumPackagesButton(
              planText: '6 Months Plan',
              package: '\$ 35.00 / Month',
            ),
          ),
          SizedBox(
            height: 16.sp,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.sp,
              right: 25.sp,
            ),
            child: AppButtons.PremiumPackagesButton(
              planText: '3 Months Plan',
              package: '\$ 40.00 / Month',
            ),
          ),
        ],
      ),
    );
  }
}
