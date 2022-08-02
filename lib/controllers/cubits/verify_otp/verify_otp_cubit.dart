import 'dart:convert';

import 'package:bitborg/models/custom_models/color_constraints.dart';
import 'package:bitborg/views/authentication_views/login_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:snack/snack.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpInitial());

  Future<void> verifyOtp({required String otp, required BuildContext context, required String email}) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PATCH', Uri.parse('http://65.0.203.20:3000/main/email-verify'));
    request.body = json.encode({
      "email":email,
      "otp": otp
    });
    request.headers.addAll(headers);
      emit(VerifyOtpLoading());
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      emit(VerifyOtpLoaded());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
    else {

      SnackBar(
          backgroundColor: AppColors.themeYellowColor,
          content: Text('Otp is Invalid')).show(context);
      emit(VerifyOtpLoaded());
      emit(VerifyOtpLoaded());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    print(response.reasonPhrase);
    }
  }
}
