import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_resturant_app/network/helper.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword=true;

  void changePasswordVisibility(){
    isPassword = ! isPassword;
    suffix =isPassword? Icons.visibility:Icons.visibility_off;
    emit(RegisterIsPasswordVisibilityState());
  }

  // void userRegister({@required String phone, @required String password,@required String username}) {
  //   emit(RegisterLoadingState());
  //   Helper.postData(
  //     data: {
  //       'name':username,
  //       "password_confirmation":password,
  //       "password":password,
  //       "mobile":phone,
  //     },
  //     url:"register",
  //   ).then((value){
  //     print(value.data.toString());
  //     emit(RegisterSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(RegisterErrorState(error.toString()));
  //   });
  // }

}