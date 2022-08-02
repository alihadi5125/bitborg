import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/cubits/home_cubits/news_page_view_cubit.dart';
import '../../../controllers/pageviews_controllers.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';

class NewsCategories extends StatelessWidget {
  const NewsCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NewsPageViewCubit, int>(
      builder: (context, state) {
        return Container(
          height: 70.sp,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(
            left: 14.sp,
          ),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(
              androidOverscrollIndicator:
              AndroidOverscrollIndicator.stretch,
            ),
            child: SingleChildScrollView(
              controller: ScrollControl.controller,
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 0);
                          PageViewControllers.newsPageViewController
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
                      width: 16.sp,
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 1);
                          PageViewControllers.newsPageViewController
                              .animateToPage(
                            1,
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
                                  'Favourite Coins',
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
                      width: 24.sp,
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 2);
                          PageViewControllers.newsPageViewController
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
                                  'Popular Events',
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
                      width: 25.sp,
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 3);
                          PageViewControllers.newsPageViewController
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
                                  'Neutral',
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
                      width: 25.sp,
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 4);
                          PageViewControllers.newsPageViewController
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
                                  'Positive',
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
                      width: 25.sp,
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 5);
                          PageViewControllers.newsPageViewController
                              .animateToPage(
                            5,
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
                                  'Negative',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 5
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 5
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
                                  color: state == 5
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
                              .read<NewsPageViewCubit>()
                              .setIndexNewsPageView(pageIndex: 6);
                          PageViewControllers.newsPageViewController
                              .animateToPage(
                            6,
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
                                  'Technical  Analysis',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -1.sp,
                                    color: state == 6
                                        ? AppColors.themeYellowColor
                                        : AppColors.greyColor,
                                    fontWeight: state == 6
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
                                  color: state == 6
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
                      width: 20.sp,
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
class ScrollControl{
  static ScrollController controller = ScrollController();
}
