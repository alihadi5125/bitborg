import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class ResendCodeCubit extends Cubit<bool> {
  ResendCodeCubit(initialState) : super(initialState);

  resend({required value}){
    emit(value);
  }

}
