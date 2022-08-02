import 'dart:convert';

import 'package:bitborg/controllers/cubits/verify_mail/verfy_email_cubit.dart';
import 'package:bitborg/views/verification_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:snack/snack.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Future<void> login({  required String fullName, required String country,required String email, required String password, required BuildContext context}) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://65.0.203.20:3000/main/auth'));
    request.body = json.encode({
      "full_name": fullName.trim(),
      "email": email.trim(),
      "country": country.trim(),
      "password": password.trim()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
      emit(SignUpLoading());
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      emit(SignUpLoaded());
      context.read<VerfyEmailCubit>().verifyEmail(email: email, context: context);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  VerificationScreen(email: email.trim(),)),);
    }
    else {
      SnackBar(content: Text('User Already exists')).show(context);
      emit(SignUpError());
      print(response.reasonPhrase);
    }

  }
}
