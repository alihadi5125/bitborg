import 'dart:convert';

import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/repositories/spot_signal_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'spot_signal_state.dart';

class SpotSignalCubit extends Cubit<SpotSignalState> {
  SpotSignalCubit() : super(SpotSignalInitial());
  Future<bool> allSignal()async {
    print("spot api");
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/calls/spot/${SpotSignalController.skip.toString()}/10'));

    request.headers.addAll(headers);
    emit(SpotSignalLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SpotSignalController.data.addAll(List<SpotSignalModel>.from(json.decode(await response.stream.bytesToString()).map((x) {
        if(x!=null){
          return SpotSignalModel.fromJson(x);
        }

      })));
      print("length"+SpotSignalController.data.length.toString());

      SpotSignalController.skip=SpotSignalController.skip+10;
      emit(SpotSignalLoaded());

      return true;
    }
    else {
      emit(SpotSignalLoading());
      return false;
      print(response.reasonPhrase);
    }
  }
}
class SpotSignalController{
  static List<SpotSignalModel> data=[];
  static int skip=10;
}

