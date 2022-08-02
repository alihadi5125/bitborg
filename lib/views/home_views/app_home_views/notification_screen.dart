import 'package:bitborg/controllers/custom_widgets/status_bar_configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
        child: Scaffold(
      backgroundColor: AppColors.blackishColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondBlackishColor,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 22.sp,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              AppIcons.arrow_left,
              color: AppColors.pureWhiteColor,
              size: 14.sp,
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 25.sp,
            right: 25.sp,
          ),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              height: 35.sp,
              width: 127.sp,
              padding: EdgeInsets.only(
                top: 13.sp,
              ),
              child: Text(
                '10 Notifications Found',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.greyColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemCount: 15,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.sp,
                );
              },
              itemBuilder: (context, index) => Container(
                height: 100.sp,
                decoration: BoxDecoration(
                  color: AppColors.secondBlackishColor,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/Group 1182.png',
                        height: 68.sp,
                        width: 68.sp,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex : 2,
                            child: Text(
                              '20 July, 2021    07: 30 am',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.greyColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Bitcoin\'s Upgrade for the Ages Taproot is Here',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.pureWhiteColor,
                                fontSize: 12.sp,
                                height: 1.2.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                debugPrint(
                                    'click to read button has been pressed');
                              },
                              child: Text(
                                'Click to read',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: AppColors.themeYellowColor,
                                  fontSize: 12.sp,
                                  letterSpacing: -1.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          AppIcons.circle,
                          color: AppColors.themeYellowColor,
                          size: 10.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
