import 'package:bitborg/controllers/cubits/onboarding_cubits/onboarding_page_index_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/onboarding_texts.dart';
import 'package:bitborg/controllers/onboarding_pageview_controller.dart';
import 'package:bitborg/views/authentication_views/login_screen.dart';
import 'package:bitborg/views/onboarding_views/onboarding_first_screen.dart';
import 'package:bitborg/views/onboarding_views/onboarding_second_screen.dart';
import 'package:bitborg/views/onboarding_views/onboarding_third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/app_icons_icons.dart';
import '../../models/custom_models/color_constraints.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    OnBoardingPageViewController.onBoardingSelectedPage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingPageIndexCubit(0),
      child: StatusBarConfiguration.statusBarConfiguration(
        child: BlocBuilder<OnBoardingPageIndexCubit, int>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: const ScrollBehavior(
                      androidOverscrollIndicator:
                          AndroidOverscrollIndicator.stretch,
                    ),
                    child: PageView(
                      controller:
                          OnBoardingPageViewController.onBoardingSelectedPage,
                      onPageChanged: (index) {
                          context
                              .read<OnBoardingPageIndexCubit>()
                              .setIndex(index: index);
                      },
                      children: const [
                        OnBoardingFirstScreen(),
                        OnBoardingSecondScreen(),
                        OnBoardingThirdScreen(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.52.sh,
                    right: 0.sp,
                    left: 0.sp,
                    child: Container(
                      color: AppColors.blackishColor,
                      height: 16.sp,
                      width: 1.sw,
                      alignment: Alignment.center,
                      child: SmoothPageIndicator(
                        controller:
                            OnBoardingPageViewController.onBoardingSelectedPage,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.themeYellowColor,
                          spacing: 4.sp,
                          dotColor: AppColors.blankSmoothIndicatorColor,
                          paintStyle: PaintingStyle.fill,
                          dotHeight: 9.sp,
                          dotWidth: 9.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.55.sh,
                    right: 0.sp,
                    left: 0.sp,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 25.sp,
                      ),
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          color: AppColors.secondBlackishColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.sp),
                            topLeft: Radius.circular(25.sp),
                          )),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 0,
                            child: state == 0
                                ? OnBoardingTexts.tittle(
                              'Unlock all Features',)
                                : state == 1
                                ? OnBoardingTexts.tittle(
                              'All Important News',)
                                : OnBoardingTexts.tittle(
                              'Trading Signals',
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 20.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: state == 0
                                ? OnBoardingTexts.subTittle(
                                    'Get all the latest Signals, News, Hidden \nGems and Airdrops from our Expert Traders!',
                                  )
                                : state == 1
                                    ? OnBoardingTexts.subTittle(
                                        'We keep an eye on the news so you\ndon\'t have to. We share all the important\nNews with our Subscribers on a daily basis.',
                                      )
                                    : OnBoardingTexts.subTittle(
                                        'Our team gives the best trading signals\nfor Futures and Spot Trading with a record\n96% Accuracy',
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70.sp,
                    left: 30.sp,
                    right: 0.sp,
                    child: state == 0
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              OnBoardingPageViewController
                                  .onBoardingSelectedPage
                                  .previousPage(
                                duration: const Duration(
                                  milliseconds: 800,
                                ),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                backgroundColor: AppColors.secondBlackishColor,
                                color: AppColors.themeYellowColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 45.sp,
                    right: 25.sp,
                    child:  InkWell(
                       onTap: () {
                         state != 2 ?
                        OnBoardingPageViewController.onBoardingSelectedPage
                            .nextPage(
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                          curve: Curves.easeInOut,
                        ) : Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  LoginScreen()),);
                      },
                      child: CircularPercentIndicator(
                        radius: 40.33.sp,
                        lineWidth: 2.sp,
                        backgroundColor: AppColors.secondBlackishColor,
                        percent: state == 0
                            ? 0.33
                            : state == 1
                                ? 0.66
                                : 1.0,
                        progressColor: AppColors.themeYellowColor,
                        center: Container(
                          height: 70.sp,
                          width: 70.sp,
                          decoration: BoxDecoration(
                            color: AppColors.themeYellowColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            AppIcons.arrowright,
                            color: AppColors.pureWhiteColor,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.sp,
                    right: 25.sp,
                    child: Container(
                      color: AppColors.blackishColor,
                      child: InkWell(
                        onTap: () {
                          OnBoardingPageViewController.onBoardingSelectedPage
                              .animateToPage(
                            2,
                            duration: const Duration(
                              milliseconds: 800,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: state == 2
                            ? const SizedBox()
                            : Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.themeYellowColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
