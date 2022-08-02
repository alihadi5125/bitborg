import 'package:bitborg/controllers/cubits/home_cubits/main_page_view_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/pageviews_controllers.dart';
import '../../../models/custom_models/app_icons_icons.dart';

class CommingSoonAlertDialog extends StatelessWidget {
  const CommingSoonAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageViewCubit, int>(
      builder: (context, state) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.black54,
          content: Container(
            height: 330.sp,
            width: 327.sp,
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              color: AppColors.blackishColor,
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      AppIcons.cross_circle,
                      color: AppColors.themeYellowColor,
                      size: 24.sp,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.asset(
                        'assets/images/Group 1188.png',
                        height: 70.sp,
                        width: 70.sp,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 22.sp,
                        child: Text(
                          'Coming Soon',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.pureWhiteColor,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'The premium subscription will be launch soon To get notified Please enter your email below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.sp,
                          color: AppColors.pureWhiteColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        cursorColor: AppColors.pureWhiteColor,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 13.5.sp,
                            color: AppColors.textFieldTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: AppColors.textFieldFillColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                              5.0.sp,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 20.sp,
                            top: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            context.read<MainPageViewCubit>().setIndexMainPageView(pageIndex: 4);
                            PageViewControllers.mainPageViewController.animateToPage(
                              4,
                              duration: const Duration(
                                milliseconds: 1,
                              ),
                              curve: Curves.easeInOut,
                            );
                            Navigator.of(context).pop();
                          },
                          child: AppButtons.FilledYellowButton(
                              onTopText: 'Let me know')),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
