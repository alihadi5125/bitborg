import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/models/negative_news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'negative_news_state.dart';

class NegativeNewsCubit extends Cubit<NegativeNewsState> {
  NegativeNewsCubit() : super(NegativeNewsInitial());

  Future<bool> getAllNew() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/news/Negative/10/10/sentiment'));

    request.headers.addAll(headers);

    emit(NegativeNewsLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      emit(NegativeNewsLoaded());

      NegativeNewsController.data=NegativeNewsModel.fromRawJson(await response.stream.bytesToString());

      if(NegativeNewsController.data.obj.isNotEmpty){
        NegativeNewsController.listData.addAll(NegativeNewsController.data.obj);
        return true;
      }
      else{
        return false;
      }

    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
class NegativeNewsController{
  static NegativeNewsModel data=NegativeNewsModel(success: true, obj: []);
  static List<Obj> listData=[];
}
