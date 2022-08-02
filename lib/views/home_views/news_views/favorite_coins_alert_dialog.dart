import 'package:bitborg/controllers/cubits/get_fav_coints/get_fav_coins_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/custom_widgets/app_buttons.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';

class FavoriteCoinsAlertDialog extends StatelessWidget {
  const FavoriteCoinsAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.black54,
      content: Container(
        height: 1.sh / 2.3,
        width: 1.sh / 1,
        padding: EdgeInsets.all(18.sp),
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
                  size: 25.sp,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'assets/images/Group 1186.png',
                      width: 100.sp,
                      height: 100.sp,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Favourite Coins',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${FavCoinsController.coins.length.toString()}  Coins  Found',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor,
                        letterSpacing: -1.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child:ListView.builder(
                        itemCount: FavCoinsController.coins.length,
                        itemBuilder: (context, index){
                      return Container(
                        height: 30.sp,
                        margin: EdgeInsets.only(bottom: 10.sp),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset("assets/images/btc.png")),
                            ),
                            Expanded(
                              flex:5,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(FavCoinsController.coins[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
