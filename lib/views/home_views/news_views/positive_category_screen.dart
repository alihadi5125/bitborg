import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/positive_news_cubit/positive_news_cubit.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/home_views/news_views/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PositiveCategoryScreen extends StatefulWidget {
  const PositiveCategoryScreen({Key? key}) : super(key: key);

  @override
  State<PositiveCategoryScreen> createState() => _PositiveCategoryScreenState();
}

class _PositiveCategoryScreenState extends State<PositiveCategoryScreen> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PositiveNewsController.listData.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: BlocBuilder<PositiveNewsCubit, PositiveNewsState>(
        builder: (context, state) {
          return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                reverse: false,
                onRefresh: () async {
                  refreshController.requestRefresh();
                  final result = await context.read<PositiveNewsCubit>().getAllNew();
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.loadNoData();
                  }
                },
                onLoading: () async {
                  refreshController.requestLoading();
                  final result = await context.read<PositiveNewsCubit>().getAllNew();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadNoData();
                  }
                },
                child: ListView.builder(

                    shrinkWrap: true,
                    itemCount: PositiveNewsController.listData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>
                                NewsDetailScreen(
                                  title: PositiveNewsController.listData[index].title,
                                  text: PositiveNewsController.listData[index].text,
                                  senitment: PositiveNewsController.listData[index].sentiment,
                                  date: PositiveNewsController.listData[index].date,
                                  url: PositiveNewsController.listData[index].newsUrl,
                                  imageUrl:PositiveNewsController.listData[index].imageUrl ,
                                )),);
                        },
                        child: AppButtons.AllNewsCard(
                            value: PositiveNewsController.listData[index].sentiment,
                            date: PositiveNewsController.listData[index].date,
                            tittle: PositiveNewsController.listData[index].title,
                            description: PositiveNewsController.listData[index].text,
                            image: PositiveNewsController.listData[index].imageUrl
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
