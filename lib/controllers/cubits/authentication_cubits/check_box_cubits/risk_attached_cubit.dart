import 'package:bloc/bloc.dart';

class RiskAttachedCubit extends Cubit<bool> {
  RiskAttachedCubit(bool initialState) : super(true);
  checked({required checked}){
    emit(checked);
  }
}
