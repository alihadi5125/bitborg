import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/negative_news_cubit/negative_news_cubit.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/home_views/news_views/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NegativeCategoryScreen extends StatefulWidget {
  const NegativeCategoryScreen({Key? key}) : super(key: key);

  @override
  State<NegativeCategoryScreen> createState() => _NegativeCategoryScreenState();
}

class _NegativeCategoryScreenState extends State<NegativeCategoryScreen> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NegativeNewsController.listData.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child:  BlocBuilder<NegativeNewsCubit, NegativeNewsState>(
        builder: (context, state) {
          return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                reverse: false,
                onRefresh: () async {
                  refreshController.requestRefresh();
                  final result = await context.read<NegativeNewsCubit>().getAllNew();
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshCompleted();
                    refreshController.loadNoData();
                  }
                },
                onLoading: () async {
                  refreshController.requestLoading();
                  final result = await context.read<NegativeNewsCubit>().getAllNew();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.refreshCompleted();
                    refreshController.loadNoData();
                  }
                },
                child: NegativeNewsController.listData.isEmpty?Center(child: Text(
                  "No Data Found",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),):ListView.builder(
                    shrinkWrap: true,
                    itemCount: NegativeNewsController.listData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>
                                NewsDetailScreen(
                                  title: NegativeNewsController.listData[index].title,
                                  text: NegativeNewsController.listData[index].text,
                                  senitment: NegativeNewsController.listData[index].sentiment,
                                  date: NegativeNewsController.listData[index].date,
                                  url: NegativeNewsController.listData[index].newsUrl,
                                  imageUrl:NegativeNewsController.listData[index].imageUrl ,
                                )),);
                        },
                        child: AppButtons.AllNewsCard(
                            value: NegativeNewsController.listData[index].sentiment,
                            date: NegativeNewsController.listData[index].date,
                            tittle: NegativeNewsController.listData[index].title,
                            description: NegativeNewsController.listData[index].text,
                            image: NegativeNewsController.listData[index].imageUrl
                        ),
                      );
                    }),
              )
          );
        },
      ),
    );
  }
}
