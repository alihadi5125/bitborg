import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/custom_widgets/app_buttons.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../../../models/custom_models/remove_scrollglow.dart';
import '../app_home_views/notification_screen.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackishColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondBlackishColor,
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
        centerTitle: true,
        title: Text(
          'BTC USDT',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.sp,
            color: AppColors.pureWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(
                    child: const NotificationScreen(),
                    direction: AxisDirection.down),
              );
            },
            child: SizedBox(
              height: 50.sp,
              width: 55.sp,
              // color: Colors.red,
              child: Stack(
                children: [
                  Positioned(
                    top: 17.sp,
                    child: Icon(
                      AppIcons.bell,
                      color: AppColors.pureWhiteColor,
                    ),
                  ),
                  Positioned(
                    top: 11.sp,
                    left: 12.sp,
                    child: Icon(
                      AppIcons.circle,
                      color: AppColors.themeYellowColor,
                      size: 13.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.blackishColor,
        height: 0.90.sh,
        width: 1.sw,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 40.sp,
                padding: EdgeInsets.only(
                  top: 20.sp,
                  left: 25.sp,
                  right: 25.sp,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Signal # 1001',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: AppColors.pureWhiteColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        '10:20 Pm 23/06/2021',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyColor,
                          fontSize: 10.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              // AppButtons.BuySellCard(
              //     context: context,
              //     binance: 'HOLD',
              //     currentPrice: '+21.2%',
              //     risk: 'Low Risk'
              // ),
              SizedBox(
                height: 18.sp,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.sp,
                  right: 25.sp,
                ),
                child: AppButtons.BuySellSecondCard(onTopText: ''),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.sp,
                  right: 25.sp,
                ),
                child: AppButtons.BuySellSecondCard(onTopText: ''),
              ),
              SizedBox(
                height: 0.25.sh,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.sp,
                  right: 25.sp,
                ),
                child: AppButtons.BuySellButton(
                  onTopText: 'Sell',
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
