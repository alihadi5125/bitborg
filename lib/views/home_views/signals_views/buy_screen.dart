import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';

import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../app_home_views/notification_screen.dart';

class BuyScreen extends StatelessWidget {


  dynamic pairs;
  String type;
  String action;
  String risk;
  String byingZone;
  String id;
  List<dynamic> target;
  BuyScreen({
    required this.target,
    required this.id,
    required this.pairs, required this.type, required this.action, required this.byingZone,
    required this.risk
  });

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
          pairs.toString(),
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
          behavior: MyBehavior()       ,
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
                        'Signal # ${id}',
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
                        'N/A',
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
              AppButtons.BuySellCard(
                  context: context,
                  binance: action,
                  currentPrice: 'N/A',
                  risk: risk,
                pairs: pairs,
                type:type,
                zone: byingZone
              ),
              SizedBox(
                height: 10.sp,
              ),

              ListView.builder(
                shrinkWrap: true,
                  itemCount:target.length,
                  itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(bottom: 10.sp),
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
                                    'Target ${index+1}',
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
                                    'Leverage ${target[index].leverage}',
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
                                      '\$ ${target[index].pric.toString()}',
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
                                      '${target[index].remark}',
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
              })

            ],
          ),
        ),
      ),
    );
  }
}
class Target1 {
  final String leverage;
  final String remark;
  final dynamic pric;
  Target1({
    required this.leverage,
    required this.remark,
    required this.pric,
  });
}

