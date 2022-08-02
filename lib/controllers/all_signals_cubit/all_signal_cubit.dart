import 'dart:convert';

import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/all_signal_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'all_signal_state.dart';

class AllSignalCubit extends Cubit<AllSignalState> {
  AllSignalCubit() : super(AllSignalInitial());

  Future<bool> allSignal()async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/calls/all/${AllSignalController.skip.toString()}/10'));

    request.headers.addAll(headers);
    emit(AllSignalLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      AllSignalController.data.addAll(List<AllSignalModel>.from(json.decode(await response.stream.bytesToString()).map((x) {
        if(x!=null){
          return AllSignalModel.fromJson(x);
        }

      })));
      print("length"+AllSignalController.data.length.toString());

      AllSignalController.skip=AllSignalController.skip+10;
      emit(AllSignalLoaded());

      return true;
    }
    else {
      emit(AllSignalLoaded());
      return false;
    print(response.reasonPhrase);
    }
  }
}

class AllSignalController{
  static List<AllSignalModel> data=[];
  static int skip=10;
}
