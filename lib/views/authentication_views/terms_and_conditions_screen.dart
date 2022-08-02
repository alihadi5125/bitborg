import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/app_icons_icons.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
      child: Scaffold(
        backgroundColor: AppColors.blackishColor,
        appBar: AppBar(
          toolbarHeight: 110.sp,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: AppColors.blackishColor,
          flexibleSpace: SizedBox(
            height: 130.sp,
            width: 1.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 22.sp,
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      AppIcons.arrow_left,
                      color: AppColors.pureWhiteColor,
                      size: 14.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 22.sp,
                    top: 28.sp,
                  ),
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 23.sp,
                      letterSpacing: -1.sp,
                      color: AppColors.pureWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
        body: Container(
          height: 0.8.sh,
          width: 1.sw,
          color: AppColors.blackishColor,
          padding: EdgeInsets.only(
            left: 22.sp,
            right: 22.sp,
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Text(
                'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.\n\nDescription is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.\n\nDescription is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.\n\nDescription is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.\n',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.5.sp,
                  color: AppColors. greyColor,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
