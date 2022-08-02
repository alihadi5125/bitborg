
import 'package:bitborg/views/home_views/news_views/new_detail_webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../../../models/custom_models/remove_scrollglow.dart';
import '../app_home_views/notification_screen.dart';

class NewsDetailScreen extends StatelessWidget {
  String title;
  String senitment;
  String date;
  String text;
  String url;
  String imageUrl;
  NewsDetailScreen({required this.imageUrl,required this.url,required this.title, required this.date, required this.senitment, required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBlackishColor,
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
          'News',
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
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 220.sp,
                  width: 1.sw,
                  child: Image.network(imageUrl,
                  fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 170.sp
                  ),
                  height: 1.sh,
                  padding: EdgeInsets.only(
                    left: 25.sp,
                    right: 15.sp,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blackishColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 80.sp,
                        spreadRadius: 50.sp,
                        color: Colors.black87,
                        offset: Offset(0.sp, -40.sp)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 6.sp,
                      ),
                      Expanded(
                        flex: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: AppColors.pureWhiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                              child: Text(
                                text,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: AppColors.greyColor,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 23.sp,
                  padding: EdgeInsets.only(
                    left: 25.sp,
                    right: 25.sp,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 80.sp,
                            spreadRadius: 60.sp,
                            color: Colors.white54,
                            offset: Offset(
                              -20.sp, -80.sp,
                            )
                        )
                      ]
                  ),
                  margin: EdgeInsets.only(
                      top: 140.sp
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 23.sp,
                          decoration: BoxDecoration(
                            color: AppColors.pureWhiteColor,
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Center(
                            child: Text(
                             senitment,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                                color: AppColors.redColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            date.substring(0,16),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.sp,
                              color: AppColors.pureWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            AppIcons.share,
                            color: AppColors.themeYellowColor,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Share',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.sp,
                              color: AppColors.themeYellowColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0.38.sh,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 25.sp,
                      right: 25.sp,
                    ),
                    height: 23.sp,
                    width: 80.sp,
                    decoration: BoxDecoration(
                      color: AppColors.pureWhiteColor,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) =>
                              NewsDetailScreenWebView(
                                url: url,
                              )),);
                      },
                      child: Center(
                        child: Text(
                          "See more",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            color:AppColors.themeYellowColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),


          ],
        ),
      ),
    );
  }
}
