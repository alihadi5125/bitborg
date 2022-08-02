import 'dart:convert';

import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/repositories/future_signal_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'future_signal_state.dart';

class FutureSignalCubit extends Cubit<FutureSignalState> {
  FutureSignalCubit() : super(FutureSignalInitial());
  Future<bool> allSignal()async {
    print("spot api");
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/calls/futures/${FutureSignalController.skip.toString()}/10'));

    request.headers.addAll(headers);
    emit(FutureSignalLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      FutureSignalController.data.addAll(List<FutureSignalModel>.from(json.decode(await response.stream.bytesToString()).map((x) {
        if(x!=null){
          return FutureSignalModel.fromJson(x);
        }

      })));
      print("length"+FutureSignalController.data.length.toString());

      FutureSignalController.skip=FutureSignalController.skip+10;
      emit(FutureSignalLoaded());

      return true;
    }
    else {
      emit(FutureSignalLoaded());
      return false;
      print(response.reasonPhrase);
    }
  }
}
class FutureSignalController{
  static List<FutureSignalModel> data=[];
  static int skip=0;
}
