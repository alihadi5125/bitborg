import 'package:bitborg/controllers/all_signals_cubit/all_signal_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/views/home_views/signals_views/buy_screen.dart';
import 'package:bitborg/views/home_views/signals_views/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/custom_models/color_constraints.dart';
import '../../../models/custom_models/remove_scrollglow.dart';

class SignalsAllCategoryScreen extends StatefulWidget {
  const SignalsAllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SignalsAllCategoryScreen> createState() =>
      _SignalsAllCategoryScreenState();
}

class _SignalsAllCategoryScreenState extends State<SignalsAllCategoryScreen> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllSignalController.data.clear();
    AllSignalController.skip=10;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllSignalCubit, AllSignalState>(
      builder: (context, state) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            reverse: false,
            onRefresh: () async {
              refreshController.requestRefresh();
              final result = await context.read<AllSignalCubit>().allSignal();
              if (result) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshCompleted();;
                refreshController.loadNoData();
              }
            },
            onLoading: () async {
              refreshController.requestLoading();
              final result = await context.read<AllSignalCubit>().allSignal();
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
                      itemCount:AllSignalController.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  BuyScreen(
                                risk:AllSignalController.data[index].risk ,
                                type: AllSignalController.data[index].type,
                                pairs: AllSignalController.data[index].pair,
                                id: AllSignalController.data[index].id,
                                byingZone: AllSignalController.data[index].buyingZone, action: AllSignalController.data[index].action,
                                target: AllSignalController.data[index].target,

                              )),);

                          },
                          child: AppButtons.SignalsAllCategoryCard(
                              context: context,
                              binance: AllSignalController.data[index].action,
                              currentPrice: '+21.2%',
                              risk:AllSignalController.data[index].risk,
                              type:AllSignalController.data[index].type,
                            targets: AllSignalController.data[index].target.length.toString(),
                            pairs: AllSignalController.data[index].pair
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
