import 'package:bloc/bloc.dart';



class ConformPasswordVisibilityCubit extends Cubit<bool> {
  ConformPasswordVisibilityCubit(bool initialState) : super(false);
  conformPasswordVisibility({required visibility}){
    emit(visibility);
  }
}
