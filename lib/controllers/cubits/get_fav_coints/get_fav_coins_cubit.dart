import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/get_fav_coins_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:snack/snack.dart';
import 'package:http/http.dart' as http;
part 'get_fav_coins_state.dart';

class GetFavCoinsCubit extends Cubit<GetFavCoinsState> {
  GetFavCoinsCubit() : super(GetFavCoinsInitial());

  Future<void> getFavCoins() async{
    var headers = {
      'Authorization': 'Bearer ${SharedPrefs.prefs!.getString("token")}'
    };
    var request = http.Request('GET', Uri.parse('http://65.0.203.20:3000/main/coins'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
        print("api hit");
      FavCoinsController.data=FavCoinsModel.fromRawJson(await response.stream.bytesToString());


       FavCoinsController.data.users.coins.forEach((element) {
        if(FavCoinsController.coins.isEmpty){
          FavCoinsController.coins.add(element);
        }
        else{
          if(!FavCoinsController.coins.contains(element)){
            FavCoinsController.coins.add(element);
          }
        }
      });
      print(FavCoinsController.coins.toString());

    }

    else {
    print(response.reasonPhrase);
    }
  }
}

class FavCoinsController{
  static FavCoinsModel data=FavCoinsModel(users: Users(coins: [], createdAt: 1, userId: '', id: ''
  ), success: true);
  static List<String> coins=[];
}
