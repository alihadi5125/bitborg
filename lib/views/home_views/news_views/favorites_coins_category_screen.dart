import 'package:bitborg/controllers/cubits/get_fav_coints/get_fav_coins_cubit.dart';
import 'package:bitborg/controllers/fav_coins_new/fav_coins_news_cubit.dart';
import 'package:bitborg/models/custom_models/app_icons_icons.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/home_views/news_views/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controllers/custom_widgets/app_buttons.dart';
import '../../../models/custom_models/color_constraints.dart';
import 'add_coin_alert_dialog.dart';
import 'favorite_coins_alert_dialog.dart';

class FavoritesCoinsCategoryScreen extends StatefulWidget {
  const FavoritesCoinsCategoryScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesCoinsCategoryScreen> createState() => _FavoritesCoinsCategoryScreenState();
}

class _FavoritesCoinsCategoryScreenState extends State<FavoritesCoinsCategoryScreen> {


  final RefreshController refreshController =
  RefreshController(initialRefresh: true);


  @override
  void initState(){
    super.initState();
    AllFavNewsController.listData.clear();
    context.read<GetFavCoinsCubit>().getFavCoins();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      children: [
        Container(
          height: 40.sp,
          padding: EdgeInsets.only(
            left: 25.sp,
            right: 20.sp,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Icon(
                  AppIcons.heart,
                  color: AppColors.pureWhiteColor,
                  size: 17.sp,
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 10.sp,
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => const FavoriteCoinsAlertDialog(),
                    );
                  },
                  child: Text(
                    'Favourite Coins',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      letterSpacing: -1.sp,
                      color: AppColors.pureWhiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) =>  AddCoinAlertDialog(),
                    );
                  },
                  child: Text(
                    '+ Add Coin',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      letterSpacing: -1.sp,
                      color: AppColors.themeYellowColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 0.7.sh,
          child: BlocBuilder<FavCoinsNewsCubit, FavCoinsNewsState>(
            builder: (context, state) {
              return ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SmartRefresher(
                    controller: refreshController,
                    enablePullUp: true,
                    reverse: false,
                    onRefresh: () async {
                      refreshController.requestRefresh();
                      final result = await context.read<FavCoinsNewsCubit>().getAllNew();
                      if (result) {
                        refreshController.refreshCompleted();
                      } else {
                        refreshController.loadNoData();
                      }
                    },
                    onLoading: () async {
                      refreshController.requestLoading();
                      final result = await context.read<FavCoinsNewsCubit>().getAllNew();
                      if (result) {
                        refreshController.loadComplete();
                      } else {
                        refreshController.loadNoData();
                      }
                    },
                    child: ListView.builder(

                        shrinkWrap: true,
                        itemCount: AllFavNewsController.listData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (
                                    context) =>
                                    NewsDetailScreen(
                                      title: AllFavNewsController.listData[index].title,
                                      text: AllFavNewsController.listData[index].text,
                                      senitment: AllFavNewsController.listData[index].sentiment,
                                      date: AllFavNewsController.listData[index].date,
                                      url: AllFavNewsController.listData[index].newsUrl,
                                      imageUrl: AllFavNewsController.listData[index].imageUrl,
                                    )),);
                            },
                            child: AppButtons.AllNewsCard(
                                value: AllFavNewsController.listData[index].sentiment,
                                date: AllFavNewsController.listData[index].date,
                                tittle: AllFavNewsController.listData[index].title,
                                description: AllFavNewsController.listData[index].text,
                                image: AllFavNewsController.listData[index].imageUrl
                            ),
                          );
                        }),
                  )
              );
            },
          ),
        ),
      ],
    );
  }
}
