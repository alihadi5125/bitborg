import 'package:bitborg/controllers/cubits/home_cubits/main_page_view_cubit.dart';
import 'package:bitborg/controllers/cubits/home_cubits/premium_container_animation_cubit.dart';
import 'package:bitborg/controllers/pageviews_controllers.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/views/home_views/app_home_views/profile_screen.dart';
import 'package:bitborg/views/home_views/germs_views/germs_screen.dart';
import 'package:bitborg/views/home_views/premium_views/comming_soon_alert_dialog.dart';
import 'package:bitborg/views/home_views/premium_views/premium_subscription_screen.dart';
import 'package:bitborg/views/home_views/signals_views/signals_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/custom_widgets/bottom_navigation_bar.dart';
import '../../controllers/custom_widgets/static_properties.dart';
import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/app_icons_icons.dart';
import '../../models/custom_models/remove_scrollglow.dart';
import 'app_home_views/app_drawer.dart';
import 'app_home_views/app_home_screen.dart';
import 'news_views/news_pageview.dart';

class MainPageViewScreen extends StatelessWidget {
  const MainPageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageViewCubit, int>(
  builder: (context, pageIndex) {
    return BlocBuilder<PremiumContainerAnimationCubit, bool>(
      builder: (context, state) {
        return StatusBarConfiguration.statusBarConfiguration(
          child: Scaffold(
            key: StaticProperties.drawerKey,
            backgroundColor: AppColors.blackishColor,
            // ignore: unrelated_type_equality_checks
            bottomNavigationBar: pageIndex == 5 ? const SizedBox() :  const BottomNavigationBarr(),
            drawer: const AppDrawer(),
            drawerEnableOpenDragGesture: true,
            drawerScrimColor: Colors.black54,
            // TODO drawerScrimColor Color(0xff3A3D48)
            body: SizedBox(
              height: 1.sh,
              width: 1.sh,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Stack(
                  children: [
                    PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: PageViewControllers.mainPageViewController,
                      children: const [
                        HomeScreen(),  //0
                        NewsPageViewScreen(),  //1
                        SignalsPageView(),  //2
                        GermsScreen(),  //3
                        PremiumSubscriptionScreen(),  //4
                        ProfileScreen(),  //5
                      ],
                    ),
                    pageIndex == 5 || pageIndex == 4 ? const SizedBox() : Positioned(
                      bottom: 1.sh / 50,
                      child: Container(
                        height: 50.sp,
                        width: state ? 180.sp :  48.sp,
                        decoration: BoxDecoration(
                            color: AppColors.themeYellowColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.sp),
                              bottomRight: Radius.circular(12.sp),
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 0,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context.read<PremiumContainerAnimationCubit>()
                                      .animate(animate: true);
                                },
                                child: Icon(
                                  AppIcons.diamond,
                                  color: AppColors.pureWhiteColor,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: SizedBox(
                                width: 7.sp,
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: state ?  InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (context) => const CommingSoonAlertDialog(),
                                  );
                                  context.read<PremiumContainerAnimationCubit>()
                                      .animate(animate: false);
                                },
                                child: Text(
                                  'Buy Premium',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.pureWhiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ) : const SizedBox(),
                            )
                          ],
                        ),
                      ),
                    ),
                    state ? Positioned(
                      left: 167.sp,
                      bottom: 1.sh / 31,
                      child: Container(
                        height: 30.sp,
                        width: 30.sp,
                        decoration: BoxDecoration(
                            color: AppColors.themeYellowColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.1.sp,
                                spreadRadius: 0.1.sp,
                              ),
                            ]
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<PremiumContainerAnimationCubit>()
                                .animate(animate: false);
                          },
                          child: Icon(
                            AppIcons.cross_circle,
                            color: AppColors.pureWhiteColor,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ) : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  },
);
  }
}
