import 'package:bloc/bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit(bool initialState) : super(false);
  passwordVisibility({required visibility}){
    emit(visibility);
  }
}
