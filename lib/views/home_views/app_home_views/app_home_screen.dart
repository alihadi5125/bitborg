import 'package:bitborg/controllers/custom_widgets/static_properties.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/views/home_views/app_home_views/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../../../models/custom_models/remove_scrollglow.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                      'Home',
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
        ],
      ),
    );
  }
}
