import 'package:bitborg/controllers/all_news_cubit/all_new_cubit.dart';
import 'package:bitborg/controllers/cubits/home_cubits/news_cubits/all_news_cubit.dart';
import 'package:bitborg/controllers/custom_widgets/app_buttons.dart';
import 'package:bitborg/controllers/custom_widgets/static_properties.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../models/custom_models/color_constraints.dart';
import 'news_detail_screen.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllNewsController.listData.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: BlocBuilder<AllNewCubit, AllNewState>(
        builder: (context, state) {
          return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SmartRefresher(
                controller: refreshController,
                enablePullUp: true,
                reverse: false,
                onRefresh: () async {
                  refreshController.requestRefresh();
                  final result = await context.read<AllNewCubit>().getAllNew();
                  if (result) {
                    refreshController.refreshCompleted();
                  } else {
                    refreshController.refreshCompleted();;
                    refreshController.loadNoData();
                  }
                },
                onLoading: () async {
                  refreshController.requestLoading();
                  final result = await context.read<AllNewCubit>().getAllNew();
                  if (result) {
                    refreshController.loadComplete();
                  } else {
                    refreshController.refreshCompleted();
                    refreshController.loadNoData();
                  }
                },
                child: ListView.builder(

                    shrinkWrap: true,
                    itemCount: AllNewsController.listData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>
                                NewsDetailScreen(
                              title: AllNewsController.listData[index].title,
                              text: AllNewsController.listData[index].text,
                              senitment: AllNewsController.listData[index].sentiment,
                              date: AllNewsController.listData[index].date,
                                  url: AllNewsController.listData[index].newsUrl,
                                  imageUrl:AllNewsController.listData[index].imageUrl ,
                            )),);
                        },
                        child: AppButtons.AllNewsCard(
                          value: AllNewsController.listData[index].sentiment,
                          date: AllNewsController.listData[index].date,
                          tittle: AllNewsController.listData[index].title,
                          description: AllNewsController.listData[index].text,
                          image: AllNewsController.listData[index].imageUrl
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
