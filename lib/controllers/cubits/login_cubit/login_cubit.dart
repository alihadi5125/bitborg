import 'dart:convert';
import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/models/models/login_model.dart';
import 'package:bitborg/views/home_views/main_pageview_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:snack/snack.dart';
import 'package:http/http.dart' as http;
part 'login_state.dart';

class LoginApiCubit extends Cubit<LoginState> {
  LoginApiCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password, required BuildContext context}) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://65.0.203.20:3000/main/login'));
    request.body = json.encode({
      "email": email.trim(),
      "password": password.trim()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      LoginModel data=LoginModel.fromRawJson(await response.stream.bytesToString());
      SharedPrefs.prefs!.setString("token", data.jwt);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPageViewScreen()),);
    }
    else {
      if(response.statusCode==401){
        SnackBar(content: Text('Invalid Password')).show(context);
      }
      if(response.statusCode==400){

        SnackBar(
            backgroundColor: AppColors.themeYellowColor,
            content: Text('No User Found')).show(context);
      }
    print(response.reasonPhrase);
    }

  }
}
