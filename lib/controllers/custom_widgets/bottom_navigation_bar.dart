import 'package:bitborg/controllers/pageviews_controllers.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/app_icons_icons.dart';
import '../cubits/home_cubits/main_page_view_cubit.dart';

class BottomNavigationBarr extends StatelessWidget {
  const BottomNavigationBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageViewCubit, int>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 28.sp),
          height: 80.sp,
          decoration: BoxDecoration(
            color: AppColors.secondBlackishColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.sp),
              topLeft: Radius.circular(20.sp),
            ),
          ),
          child: Row(

            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 0);
                    PageViewControllers.mainPageViewController.animateToPage(
                        0,
                        duration: const Duration(
                          milliseconds: 1,
                        ),
                        curve: Curves.easeInOut,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            AppIcons.home,
                            color: state == 0 ? AppColors.themeYellowColor :  AppColors.greyColor,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 7.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: state == 0 ? AppColors.themeYellowColor :  AppColors.greyColor,
                              fontSize: 13.sp,
                              fontWeight: state == 0 ? FontWeight.w700 : FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 1);
                    PageViewControllers.mainPageViewController.animateToPage(
                      1,
                      duration: const Duration(
                        milliseconds: 1,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            AppIcons.news,
                            color: state == 1 ? AppColors.themeYellowColor :  AppColors.greyColor,
                            size: 35.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 7.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'News',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: state == 1 ? AppColors.themeYellowColor :  AppColors.greyColor,
                              fontSize: 13.sp,
                              fontWeight: state == 1 ? FontWeight.w700 : FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 2);
                    PageViewControllers.mainPageViewController.animateToPage(
                      2,
                      duration: const Duration(
                        milliseconds: 1,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Align(

                          child: Icon(
                            AppIcons.signals,
                            color: state == 2 ? AppColors.themeYellowColor :  AppColors.greyColor,
                            size: 33.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 7.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          'Signals',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: state == 2 ? AppColors.themeYellowColor :  AppColors.greyColor,
                            fontSize: 13.sp,
                            fontWeight: state == 2 ? FontWeight.w700 : FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 3);
                    PageViewControllers.mainPageViewController.animateToPage(
                      3,
                      duration: const Duration(
                        milliseconds: 1,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image.asset(
                          'assets/images/Group 1183.png',
                          height: 35.sp,
                          width: 33.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 7.sp,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          'Gems',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: state == 3 ? AppColors.themeYellowColor :  AppColors.greyColor,
                            fontSize: 13.sp,
                            fontWeight: state == 3 ? FontWeight.w700 : FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
