import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/neutral_new/neutral_news_cubit.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/home_views/news_views/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NeutralCategoryScreen extends StatefulWidget {
  const NeutralCategoryScreen({Key? key}) : super(key: key);

  @override
  State<NeutralCategoryScreen> createState() => _NeutralCategoryScreenState();
}

class _NeutralCategoryScreenState extends State<NeutralCategoryScreen> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NeutralNewsController.listData.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: BlocBuilder<NeutralNewsCubit, NeutralNewsState>(
        builder: (context, state) {
          return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                reverse: false,
                onRefresh: () async {
                  refreshController.requestRefresh();
                  final result = await context.read<NeutralNewsCubit>().getAllNew();
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.loadNoData();
                  }
                },
                onLoading: () async {
                  refreshController.requestLoading();
                  final result = await context.read<NeutralNewsCubit>().getAllNew();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadNoData();
                  }
                },
                child: ListView.builder(

                    shrinkWrap: true,
                    itemCount: NeutralNewsController.listData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>
                                NewsDetailScreen(
                                  title: NeutralNewsController.listData[index].title,
                                  text: NeutralNewsController.listData[index].text,
                                  senitment: NeutralNewsController.listData[index].sentiment,
                                  date: NeutralNewsController.listData[index].date,
                                  url: NeutralNewsController.listData[index].newsUrl,
                                  imageUrl:NeutralNewsController.listData[index].imageUrl
                                )),);
                        },
                        child: AppButtons.AllNewsCard(
                            value: NeutralNewsController.listData[index].sentiment,
                            date: NeutralNewsController.listData[index].date,
                            tittle: NeutralNewsController.listData[index].title,
                            description: NeutralNewsController.listData[index].text,
                            image: NeutralNewsController.listData[index].imageUrl
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
