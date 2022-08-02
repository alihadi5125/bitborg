import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/models/fav_news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'fav_coins_news_state.dart';

class FavCoinsNewsCubit extends Cubit<FavCoinsNewsState> {
  FavCoinsNewsCubit() : super(FavCoinsNewsInitial());
  Future<bool> getAllNew() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/news/Neutral/0/10/favourite'));

    request.headers.addAll(headers);

    emit(FavCoinsNewsLoading());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      emit(FavCoinsNewsLoaded());
      AllFavNewsController.data=FavNewsModel.fromRawJson(await response.stream.bytesToString());
      if(AllFavNewsController.data.obj.isNotEmpty){
        AllFavNewsController.listData.addAll(AllFavNewsController.data.obj);
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

class AllFavNewsController{
  static FavNewsModel data=FavNewsModel(success: true, obj: []);
  static List<Obj> listData=[];
}
