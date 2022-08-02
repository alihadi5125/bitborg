import 'package:bitborg/controllers/add_to_fav_cubit/add_to_fav_cubit.dart';
import 'package:bitborg/controllers/cubits/get_fav_coints/get_fav_coins_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snack/snack.dart';

import '../../../controllers/custom_widgets/app_buttons.dart';
import '../../../models/custom_models/app_icons_icons.dart';
import '../../../models/custom_models/color_constraints.dart';

class AddCoinAlertDialog extends StatelessWidget {


  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.black54,
      content: Container(
        height: 1.sh / 2.25,
        width: 1.sh / 1,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    'assets/images/Group 1185.png',
                    height: 100.sp,
                    width: 100.sp,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 22.sp,
                    child: Text(
                      'Add Your Favourite Coins',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'E.g BTC,Eth,BNB etc',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: input,
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
                      hintText: 'Separate coin with "," (BTC,ETH)',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.sp,
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
                        top: 35.sp,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BlocBuilder<AddToFavCubit, AddToFavState>(
                    builder: (context, state) {
                      return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            List<String> array = [];
                            if (input.text.isNotEmpty) {
                              print(FavCoinsController.coins.toString());
                              array = input.text.split(",");

                              array.forEach((element) {
                                if (!FavCoinsController.coins.contains(element)) {
                                  FavCoinsController.coins.add(element);
                                }
                                else {}
                              });

                              context.read<AddToFavCubit>().addToFav(data: array);
                            }


                          },
                          child: Container(
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
                                child: state is AddToFavLoading?CircularProgressIndicator(
                                  color: Colors.white,
                                ):Text(
                                  "Add Coins",
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
                          ));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
