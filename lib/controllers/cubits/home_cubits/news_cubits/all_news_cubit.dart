import 'package:bitborg/models/repositories/all_news_category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'all_news_state.dart';


class AllNewsCubit extends Cubit<AllNewsState> {
  // final AllNewsCategoryRepo allNewsCategoryRepo;
  AllNewsCubit() : super(AllNewsInitial());

  Future<void> triggerApi() async{
  try{
    emit(AllNewsLoading());
    await AllNewsCategoryRepo.getAllNewsCategoryData();
    emit(AllNewsLoaded());
  } catch (error) {
    emit(AllNewsError());
  }
  }
}
