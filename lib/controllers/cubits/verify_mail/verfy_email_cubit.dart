import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:snack/snack.dart';
import 'package:http/http.dart' as http;
part 'verfy_email_state.dart';

class VerfyEmailCubit extends Cubit<VerfyEmailState> {
  VerfyEmailCubit() : super(VerfyEmailInitial());

  Future<void> verifyEmail({required String email, required BuildContext context}) async{
    emit(VerfyEmailLoading());
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('http://65.0.203.20:3000/main/email-verify'));
  request.body = json.encode({
  "email": email.trim(),
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  SnackBar(content: Text('Otp Sent Successfully')).show(context);
  emit(VerfyEmailLoaded());
  }
  else {
  print(response.reasonPhrase);
  }
  }
}
