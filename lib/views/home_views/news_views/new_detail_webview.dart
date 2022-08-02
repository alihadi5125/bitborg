import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/custom_page_routes.dart';
import '../../../models/custom_models/remove_scrollglow.dart';
import '../app_home_views/notification_screen.dart';

class NewsDetailScreenWebView extends StatefulWidget {
  String url;

  NewsDetailScreenWebView({required this.url});

  @override
  State<NewsDetailScreenWebView> createState() => _NewsDetailScreenWebViewState();
}

class _NewsDetailScreenWebViewState extends State<NewsDetailScreenWebView> {
  final Set<Factory> gestureRecognizers = [Factory(() => EagerGestureRecognizer())].toSet();

  UniqueKey _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

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
        Container(
          color: Colors.red,
          height: 0.89.sh,
          child: WebView(
            key: _key,
            initialUrl: widget.url,
          ),
        )


          ],
        ),
      ),
    );
  }
}
