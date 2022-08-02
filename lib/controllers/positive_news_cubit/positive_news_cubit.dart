import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/models/positive_news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'positive_news_state.dart';

class PositiveNewsCubit extends Cubit<PositiveNewsState> {
  PositiveNewsCubit() : super(PositiveNewsInitial());
  Future<bool> getAllNew() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/news/Positive/10/10/sentiment'));

    request.headers.addAll(headers);

    emit(PositiveNewsLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      emit(PositiveNewsLoaded());
      PositiveNewsController.data=PositiveNewsModel.fromRawJson(await response.stream.bytesToString());
      if(PositiveNewsController.data.obj.isNotEmpty){
        PositiveNewsController.listData.addAll(PositiveNewsController.data.obj);
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
class PositiveNewsController{
  static PositiveNewsModel data=PositiveNewsModel(success: true, obj: []);
  static List<Obj> listData=[];
}
