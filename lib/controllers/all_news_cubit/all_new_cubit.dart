import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/models/all_news_model.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'all_new_state.dart';

class AllNewCubit extends Cubit<AllNewState> {
  AllNewCubit() : super(AllNewInitial());

  Future<bool> getAllNew() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/news/Neutral/10/10/all'));

    request.headers.addAll(headers);

    emit(AllNewLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      emit(AllNewLoaded());

      AllNewsController.data=AllNewsModel.fromRawJson(await response.stream.bytesToString());

      if(AllNewsController.data.obj.isNotEmpty){
        AllNewsController.listData.addAll(AllNewsController.data.obj);
        return true;
      }
      else{
        return false;
      }

      return true;
    }
    else {
    print(response.reasonPhrase);
    return false;
    }
  }
}
class AllNewsController{
  static AllNewsModel data=AllNewsModel(success: true, obj: []);
  static List<Obj> listData=[];
}
