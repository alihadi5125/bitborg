import 'package:bitborg/controllers/cubits/home_cubits/main_page_view_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/static_properties.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/views/home_views/app_home_views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/pageviews_controllers.dart';
import '../../../models/custom_models/app_icons_icons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageViewCubit, int>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: AppColors.blackishColor,
          ),
          child: Container(
            width: 1.sw/1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.sp),
                topRight: Radius.circular(15.sp),
              ),
              color: AppColors.blackishColor,
            ),
            child: Drawer(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 15.sp,
                  ),
                  Container(
                    height: 40.sp,
                    width: 1.sw,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                      right: 10.sp,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        AppIcons.cross_circle,
                        color: AppColors.themeYellowColor,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 5);
                      PageViewControllers.mainPageViewController.jumpToPage(5);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 170.sp,
                      padding: EdgeInsets.only(
                        left: 28.sp,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: Container(
                              height: 45.sp,
                              width: 45.sp,
                              decoration: BoxDecoration(
                                color: AppColors.themeYellowColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                AppIcons.user,
                                color: AppColors.pureWhiteColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 5.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              'Muzamil Afridi',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.pureWhiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 5.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              'mfkhan816@gmail.com',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.5.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 15.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 50.sp,
                              ),
                              child: Container(
                                height: 44.5.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.premiumContainerColor,
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      AppIcons.diamond,
                                      color: AppColors.themeYellowColor,
                                      size: 20.sp,
                                    ),
                                    Text(
                                      '  Premium User',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: AppColors.themeYellowColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.sp,
                                        letterSpacing: -1.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.greyColor,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 40.sp,
                          ),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: (){
                              context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 0);
                              PageViewControllers.mainPageViewController.jumpToPage(0);
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: Icon(
                                    AppIcons.hometwo,
                                    color: AppColors.pureWhiteColor,
                                    size: 27.sp,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: SizedBox(
                                    width: 14.sp,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: AppColors.pureWhiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 25.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 40.sp,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Icon(
                                  AppIcons.headset,
                                  color: AppColors.pureWhiteColor,
                                  size: 23.sp,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: SizedBox(
                                  width: 19.sp,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.pureWhiteColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 25.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 42.sp,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Icon(
                                  AppIcons.settings,
                                  color: AppColors.pureWhiteColor,
                                  size: 24.sp,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: SizedBox(
                                  width: 17.sp,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.pureWhiteColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 25.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 44.sp,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Icon(
                                  AppIcons.signout,
                                  color: AppColors.pureWhiteColor,
                                  size: 23.sp,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: SizedBox(
                                  width: 17.sp,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.pureWhiteColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 1.sh / 3.1,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 41.sp,
                            right: 50.sp,
                          ),
                          child: Container(
                            height: 44.5.sp,
                            decoration: BoxDecoration(
                              color: AppColors.themeYellowColor,
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  AppIcons.diamond,
                                  color: AppColors.secondBlackishColor,
                                  size: 20.sp,
                                ),
                                Text(
                                  '  Upgrade Plan',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.secondBlackishColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                    letterSpacing: -1.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
