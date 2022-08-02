import 'package:bloc/bloc.dart';

class MainPageViewCubit extends Cubit<int> {
  MainPageViewCubit(int initialState) : super(0);
  setIndexMainPageView({required pageIndex}){
    emit(pageIndex);
  }
}
