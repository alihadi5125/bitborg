
import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/spot_signal_cubit/spot_signal_cubit.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/home_views/signals_views/buy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HoldSignalCategoryScreen extends StatefulWidget {
  const HoldSignalCategoryScreen({Key? key}) : super(key: key);

  @override
  State<HoldSignalCategoryScreen> createState() => _HoldSignalCategoryScreenState();
}

class _HoldSignalCategoryScreenState extends State<HoldSignalCategoryScreen> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpotSignalController.data.clear();
    SpotSignalController.skip=10;
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotSignalCubit, SpotSignalState>(
      builder: (context, state) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            reverse: false,
            onRefresh: () async {
              refreshController.requestRefresh();
              final result = await context.read<SpotSignalCubit>().allSignal();
              if (result) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshCompleted();;
                refreshController.loadNoData();
              }
            },
            onLoading: () async {
              refreshController.requestLoading();
              final result = await context.read<SpotSignalCubit>().allSignal();
              if (result) {
                refreshController.loadComplete();
              } else {
                refreshController.refreshCompleted();
                refreshController.loadNoData();
              }
            },
            child: ListView(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  height: 40.sp,
                  width: 1.sw,
                  padding: EdgeInsets.only(
                    left: 35.sp,
                    right: 25.sp,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/bch.png',
                            width: 23.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hold BCH USDT for Long term to enjoy\nheavy gains!',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGreenColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.clear,
                            color: AppColors.greyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 0.66.sh,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 5.sp),
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:SpotSignalController.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  BuyScreen(
                                risk:SpotSignalController.data[index].risk ,
                                type: SpotSignalController.data[index].type,
                                pairs: SpotSignalController.data[index].pair,
                                id: SpotSignalController.data[index].id,
                                byingZone: SpotSignalController.data[index].buyingZone, action: SpotSignalController.data[index].action,
                                target:SpotSignalController.data[index].target,

                              )),);

                          },
                          child: AppButtons.SignalsAllCategoryCard(
                            context: context,
                            binance: SpotSignalController.data[index].action,
                            currentPrice: '+21.2%',
                            risk:SpotSignalController.data[index].risk,
                            type:SpotSignalController.data[index].type,
                            targets: SpotSignalController.data[index].target.length.toString(),
                            pairs: SpotSignalController.data[index].pair
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
