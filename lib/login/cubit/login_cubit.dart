import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_resturant_app/models/login_model.dart';
import 'package:task_resturant_app/network/helper.dart';
import 'package:http/http.dart' as http;

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginIsPasswordVisibilityState());
  }

  UserLoginModel loginModel;

  // void userLogin({
  //   @required String phone,
  //   @required String password,
  // })  {
  //
  //   final body = jsonEncode({
  //     "mobile": phone,
  //     "password": password,
  //   });
  //   print(body);
  //   const String url = "https://aq-restaurant.herokuapp.com/api/auth/login";
  //  var x= Uri.parse(url);
  //   http.post(x,body: body,
  //   ).then((value) {
  //     print(value.toString());
  //     emit(LoginSuccessState());
  //   }).catchError((error) {
  //     print("ay  7agaa");
  //     print(error.toString());
  //   });
  // }

  // void userLogin({
  //   @required String phone,
  //   @required String password,
  // }) {
  //   emit(LoginLoadingState());
  //   Helper.postData(url: "login", data: {
  //     "mobile": phone,
  //     "password": password,
  //   }).then((value) {
  //     print(value.data);
  //     emit(LoginSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(LoginErrorState(error));
  //   });
  // }
}
