import 'package:bloc/bloc.dart';

class PremiumContainerAnimationCubit extends Cubit<bool> {
  PremiumContainerAnimationCubit(bool initialState) : super(false);
  animate({required animate}){
    emit(animate);
  }
}
