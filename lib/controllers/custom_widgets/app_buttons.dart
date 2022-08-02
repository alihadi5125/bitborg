import 'package:bitborg/views/home_views/signals_views/buy_screen.dart';
import 'package:bitborg/views/home_views/signals_views/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/app_icons_icons.dart';
import '../../models/custom_models/color_constraints.dart';

class AppButtons {
  @override
  static Widget FilledYellowButton({
    required String onTopText,
  }) {
    return Container(
      color: AppColors.blackishColor,
      child: Container(
        height: 50.0.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.0.sp,
          ),
          color: AppColors.themeYellowColor,
        ),
        child: Center(
          child: Text(
            onTopText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.sp,
              color: AppColors.pureWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  static Widget FlatYellowButton({
    required String onTopText,
  }) {
    return Container(
      //alignment: Alignment(0.0,-0.09),
      width: 307.0.sp,
      height: 50.0.sp,
      decoration: BoxDecoration(
        color: AppColors.blackishColor,
        borderRadius: BorderRadius.circular(
          5.0.sp,
        ),
        border: Border.all(
          width: 1.0,
          color: AppColors.themeYellowColor,
        ),
      ),
      child: Center(
        child: Text(
          onTopText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.sp,
            color: AppColors.themeYellowColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  static Widget PremiumPackagesButton({
    required String planText,
    required String package,
  }) {
    return Container(
      color: AppColors.blackishColor,
      child: Container(
        height: 85.0.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.0.sp,
          ),
          color: AppColors.themeYellowColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                planText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.sp,
                  color: AppColors.blackishColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 10.sp,
              ),
            ),
            Expanded(
              flex: 0,
              child: Text(
                package,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13.5.sp,
                  color: AppColors.blackishColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  static Widget AllNewsCard({
    required String value,
    required String date,
    required String tittle,
    required String description,
    required String image,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.sp,
        right: 20.sp,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.sp),
        height: 160.sp,
        decoration: BoxDecoration(
          color: AppColors.newsCardColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        padding: EdgeInsets.all(
          12.sp,
        ),
        child: Row(
          children: [
            Expanded(
               flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.network(image,

                fit: BoxFit.fill,),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.sp,
                        bottom: 10.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 70.sp,
                              height: 30.sp,
                              decoration: BoxDecoration(
                                color: AppColors. valueContainerColor,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Center(
                                child: Text(

                                  value,

                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.sp,
                                    color: value == 'Negative'
                                        ? AppColors.redColor
                                        : value == 'Positive'
                                            ? AppColors.greenColor
                                            : AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              date,
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.secondGreyColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.sp,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(

                          tittle,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.pureWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.sp,
                      ),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(

                          description,
                            maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  static Widget SignalsAllCategoryCard({
    required BuildContext context,
    required String binance,
    required String risk,
    required String currentPrice,
    required String type,
    required String targets,
    required dynamic pairs,

  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.sp,left: 22.sp,
        right: 22.sp,),
      decoration: BoxDecoration(
        color: AppColors.signalsCardColor,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              height: 120.sp,
              padding: EdgeInsets.all(10.sp),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 120.sp,
                      width: 50.sp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 30.sp,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: SizedBox(
                                      height: 30.sp,
                                      child: Image.asset(
                                        'assets/images/btc.png',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: SizedBox(
                                      width: 5.sp,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: SizedBox(
                                      height: 30.sp,
                                      child: Image.asset(
                                        'assets/images/t.png',
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
                              height: 5.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Container(
                              height: 60.sp,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${pairs.toString()}\n\nN/A',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: AppColors.pureWhiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 120.sp,
                      width: 50.sp,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Icon(
                              AppIcons.bars_,
                              color: AppColors.yellowTwoColor,
                              size: 18.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 2.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              'Stats',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.pureWhiteColor,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 27.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              'Binance',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.pureWhiteColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 2.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: InkWell(
                              onTap: (){
                                debugPrint('Hold Button was Pressed');
                              },
                              child: Container(
                                width: 70.sp,
                                height: 25.sp,
                                decoration: BoxDecoration(
                                  color: AppColors.blackishColor,
                                  borderRadius: BorderRadius.circular(
                                    5.0.sp,
                                  ),
                                  border: Border.all(
                                    width: 1.0,
                                    color: AppColors.pureWhiteColor,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    binance,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: AppColors.pureWhiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 120.sp,
                      width: 50.sp,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 50.sp,
                              ),
                              child: Container(
                                height: 20.sp,
                                alignment: Alignment.topCenter,
                                child: Text(
                                  type,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.greyColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  width: 70.sp,
                                  height: 30.sp,
                                  decoration: BoxDecoration(
                                    color: AppColors.blackishColor,
                                    borderRadius: BorderRadius.circular(
                                      5.0.sp,
                                    ),
                                    border: Border.all(
                                      width: 1.0,
                                      color: risk == 'Low Risk' ? AppColors.lightGreenColor : AppColors.redColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      risk,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: risk == 'Low Risk' ? AppColors.lightGreenColor : AppColors.redColor,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -1.sp,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 12.sp,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  height: 30.sp,
                                  width: 85.sp,
                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGreenColor,
                                    borderRadius: BorderRadius.circular(
                                      5.0.sp,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Image.asset(
                                          'assets/images/Icon open-target.png',
                                          height: 11.sp,
                                          width: 11.sp,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Target 4',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: AppColors.pureWhiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            letterSpacing: -1.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 40.sp,
              padding: EdgeInsets.all(10.sp),
              // color: Colors.green,
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: 30.sp,
                      width: 95.sp,
                      alignment: Alignment.center,
                      child: Text(
                        'Current Price',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.pureWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: 2.sp,
                      ),
                      child: Text(
                        currentPrice,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        '10:20 Pm 23/06/2021',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  static Widget BuySellCard({
    required BuildContext context,
    required String binance,
    required String risk,
    required String currentPrice,
    required dynamic pairs,
    required String type,
    required String zone,

  }) {
    return Padding(
      padding: EdgeInsets.all(
        12.sp,
      ),
      child: Container(
        height: 152.sp,
        decoration: BoxDecoration(
          color: AppColors.signalsCardColor,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        padding: EdgeInsets.all(
          12.sp,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 158.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: 30.sp,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: SizedBox(
                                height: 30.sp,
                                child: Image.asset(
                                  'assets/images/btc.png',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: SizedBox(
                                width: 5.sp,
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: SizedBox(
                                height: 30.sp,
                                child: Image.asset(
                                  'assets/images/t.png',
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
                        height: 4.sp,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 50.sp,
                        child: Text(
                          '${pairs.toString()}\n\nN/A',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.pureWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: 10.sp,
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: Container(
                          width: 95.sp,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Current Price',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: AppColors.pureWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                          left: 2.sp,
                        ),
                        child: Text(
                          currentPrice,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 170.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Text(
                        'Binance',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.pureWhiteColor,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: 2.sp,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: InkWell(
                        onTap: (){
                          debugPrint('Hold Button was Pressed');
                        },
                        child: Container(
                          width: 70.sp,
                          height: 25.sp,
                          decoration: BoxDecoration(
                            color: AppColors.blackishColor,
                            borderRadius: BorderRadius.circular(
                              5.0.sp,
                            ),
                            border: Border.all(
                              width: 1.0,
                              color: AppColors.pureWhiteColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              binance,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.pureWhiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 180.sp,
                // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Icon(
                        AppIcons.bars_,
                        color: AppColors.yellowTwoColor,
                        size: 18.sp,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: 2.sp,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        'Stats',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.pureWhiteColor,
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 20.sp,
                        width: 70.sp,
                        alignment: Alignment.topLeft,
                        child: Text(
                          type,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greyColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
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
                      child: InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 40.sp,
                          ),
                          child: Container(
                            width: 80.sp,
                            height: 30.sp,
                            decoration: BoxDecoration(
                              color: AppColors.blackishColor,
                              borderRadius: BorderRadius.circular(
                                5.0.sp,
                              ),
                              border: Border.all(
                                width: 1.0,
                                color: risk == 'Low Risk' ? AppColors.lightGreenColor : AppColors.redColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                risk,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: risk == 'Low Risk' ? AppColors.lightGreenColor : AppColors.redColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                        child: SizedBox(
                          height: 4.sp,
                        ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 20.sp,
                        width: 90.sp,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Buying Zone  ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greyColor,
                            fontSize: 13.sp,
                            letterSpacing: -1.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          zone,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  static Widget BuySellSecondCard({
    required String onTopText,
  }) {
    return Container(
      width: 307.sp,
      height: 80.sp,
      decoration: BoxDecoration(
        color: AppColors.blackishColor,
        borderRadius: BorderRadius.circular(
          5.0.sp,
        ),
        border: Border.all(
          width: 2,
          color: AppColors.secondColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 77.sp,
              width: 20.sp,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: 10.sp,
              ),
              child: Image.asset(
                'assets/images/Icon open-target.png',
                height: 19.sp,
                width: 19.sp,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 77.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: 40.sp,
                      padding: EdgeInsets.only(
                        top: 10.sp,
                      ),
                      child: Text(
                        'Target 1',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.greyColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 30.sp,
                      child: Text(
                        'Leverage 12',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.lightGreenColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 77.sp,
              padding: EdgeInsets.only(
                right: 12.sp,
              ),
              child: SizedBox(
                height: 77.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 40.sp,
                        padding: EdgeInsets.only(
                          top: 10.sp,
                        ),
                        child: Text(
                          '\$ 1200',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greenColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: 30.sp,
                        child: Text(
                          'Stop Loss 1.93',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.redColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  static Widget BuySellButton({
    required String onTopText,
    required Color color,
  }) {
    return Container(
      color: AppColors.blackishColor,
      child: Container(
        height: 45.0.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.0.sp,
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            onTopText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.sp,
              color: AppColors.pureWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
