import 'package:bloc/bloc.dart';

class NewsPageViewCubit extends Cubit<int> {
  NewsPageViewCubit(int initialState) : super(0);
  setIndexNewsPageView({required pageIndex}){
    emit(pageIndex);
  }
}
