import 'package:bitborg/controllers/cubits/home_cubits/signals_page_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/pageviews_controllers.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';

class SignalsCategories extends StatelessWidget {
  const SignalsCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignalsPageViewCubit, int>(
      builder: (context, state) {
        return Container(
          height: 70.sp,
          padding: EdgeInsets.only(
            left: 24.sp,
          ),
          alignment: Alignment.bottomLeft,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(
              androidOverscrollIndicator:
              AndroidOverscrollIndicator.stretch,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 50.sp,
                      width: 50.sp,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context
                              .read<SignalsPageViewCubit>().setIndexSignalsPageView(pageIndex: 0);
                          PageViewControllers.signalsPageViewController
                              .animateToPage(
                            0,
                            duration: const Duration(
                              milliseconds: 3,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 0
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 0
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  AppIcons.circle,
                                  color: state == 0
                                      ? AppColors.themeYellowColor
                                      : AppColors.blackishColor,
                                  size: 7.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 20.sp,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 50.sp,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context
                              .read<SignalsPageViewCubit>().setIndexSignalsPageView(pageIndex: 1);
                          PageViewControllers.signalsPageViewController
                              .animateToPage(
                            1,
                            duration: const Duration(
                              milliseconds: 3,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Hold',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 1
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 1
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  AppIcons.circle,
                                  color: state == 1
                                      ? AppColors.themeYellowColor
                                      : AppColors.blackishColor,
                                  size: 7.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 30.sp,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 50.sp,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context
                              .read<SignalsPageViewCubit>().setIndexSignalsPageView(pageIndex: 2);
                          PageViewControllers.signalsPageViewController
                              .animateToPage(
                            2,
                            duration: const Duration(
                              milliseconds: 3,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Scalp',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 2
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 2
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  AppIcons.circle,
                                  color: state == 2
                                      ? AppColors.themeYellowColor
                                      : AppColors.blackishColor,
                                  size: 7.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 30.sp,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 50.sp,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context
                              .read<SignalsPageViewCubit>().setIndexSignalsPageView(pageIndex: 3);
                          PageViewControllers.signalsPageViewController
                              .animateToPage(
                            3,
                            duration: const Duration(
                              milliseconds: 3,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Result F/S',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 3
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 3
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  AppIcons.circle,
                                  color: state == 3
                                      ? AppColors.themeYellowColor
                                      : AppColors.blackishColor,
                                  size: 7.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 30.sp,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 50.sp,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context
                              .read<SignalsPageViewCubit>().setIndexSignalsPageView(pageIndex: 4);
                          PageViewControllers.signalsPageViewController
                              .animateToPage(
                            4,
                            duration: const Duration(
                              milliseconds: 3,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Free',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 4
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 4
                                        ? FontWeight.w600
                                        : FontWeight.w300,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  AppIcons.circle,
                                  color: state == 4
                                      ? AppColors.themeYellowColor
                                      : AppColors.blackishColor,
                                  size: 7.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 30.sp,
                    ),
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
