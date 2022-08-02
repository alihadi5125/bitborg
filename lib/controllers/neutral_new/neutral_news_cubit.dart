import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/models/neutral_news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'neutral_news_state.dart';

class NeutralNewsCubit extends Cubit<NeutralNewsState> {
  NeutralNewsCubit() : super(NeutralNewsInitial());

  Future<bool> getAllNew() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/news/Neutral/10/10/sentiment'));

    request.headers.addAll(headers);

    emit(NeutralNewsLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      emit(NeutralNewsLoaded());
      NeutralNewsController.data=NeutralNewsModel.fromRawJson(await response.stream.bytesToString());
      if(NeutralNewsController.data.obj.isNotEmpty){
        NeutralNewsController.listData.addAll(NeutralNewsController.data.obj);
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

class NeutralNewsController{
  static NeutralNewsModel data=NeutralNewsModel(success: true, obj: []);
  static List<Obj> listData=[];
}
