import 'dart:convert';
import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:snack/snack.dart';
import 'package:http/http.dart' as http;
part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit() : super(AddToFavInitial());

  Future<bool> addToFav({required List<String> data}) async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://65.0.203.20:3000/main/coins'));
    request.body = json.encode({
      "coins": data.toString()
    });
    emit(AddToFavLoading());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      emit(AddToFavLoaded());
      return true;
    }
    else {
      emit(AddToFavLoaded());
    print(response.reasonPhrase);
    return false;
    }
  }
}
