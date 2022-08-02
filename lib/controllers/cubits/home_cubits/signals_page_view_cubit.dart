import 'package:bloc/bloc.dart';

class SignalsPageViewCubit extends Cubit<int> {
  SignalsPageViewCubit(int initialState) : super(0);
  setIndexSignalsPageView({required pageIndex}){
    emit(pageIndex);
  }
}
