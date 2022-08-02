import 'package:bloc/bloc.dart';

class SelectedCountryCubit extends Cubit<String> {
  SelectedCountryCubit(String initialState) : super('');
  selectedCountry({required selectedCountry}){
    emit(selectedCountry);
  }
}
