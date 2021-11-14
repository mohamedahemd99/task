import 'dart:convert';

import 'package:flutter/material.dart';

import 'login/login_screen.dart';
import 'network/helper.dart';
import 'package:http/http.dart' as http;

void main() {
  // Helper.init();

  userLogin(password: "sahdbk",phone: "2662626626");
  // runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFed492d),
      ),
      home: LoginScreen(),
    );
  }

}
void userLogin({
  @required String phone,
  @required String password,
})  {

  final body = jsonEncode({
    "mobile": phone,
    "password": password,
  });
  print(body);
  const String url = "https://aq-restaurant.herokuapp.com/api/auth/login";
  var x= Uri.parse(url);
  http.post(x,body: body,
  ).then((value) {
    print(value.toString());
    // emit(LoginSuccessState());
  }).catchError((error) {
    print("ay  7agaa");
    print(error.toString());
  });
}
