import 'package:bloc/bloc.dart';

class TermsAndConditionsCubit extends Cubit<bool> {
  TermsAndConditionsCubit(bool initialState) : super(true);
  checked({required checked}){
    emit(checked);
  }
}
