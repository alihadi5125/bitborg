import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/home_views/signals_views/all_category_screen.dart';
import 'package:bitborg/views/home_views/signals_views/free_category_screen.dart';
import 'package:bitborg/views/home_views/signals_views/hold_category_screen.dart';
import 'package:bitborg/views/home_views/signals_views/result_category_screen.dart';
import 'package:bitborg/views/home_views/signals_views/scalp_category_screen.dart';
import 'package:bitborg/views/home_views/signals_views/signals_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/custom_widgets/static_properties.dart';
import '../../../controllers/pageviews_controllers.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../app_home_views/notification_screen.dart';

class SignalsPageView extends StatelessWidget {
  const SignalsPageView({Key? key}) : super(key: key);

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
                        'Signals',
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
            const SignalsCategories(),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: PageViewControllers.signalsPageViewController,
                    children:  [
                      SignalsAllCategoryScreen(),
                      HoldSignalCategoryScreen(),
                      ScalpCategoryScreen(),
                      ResultCategoryScreen(),
                      FreeCategoryScreen(),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
