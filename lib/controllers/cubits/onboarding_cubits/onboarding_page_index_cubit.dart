import 'package:bloc/bloc.dart';

class OnBoardingPageIndexCubit extends Cubit<int> {
  OnBoardingPageIndexCubit(int initialState) : super(0);
  setIndex({required index}){
    emit(index);
  }
}
