import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Helper {

  // static Dio dio ;
  //
  // static init(){
  //   dio= Dio(
  //     BaseOptions(
  //       baseUrl:'https://aq-restaurant.herokuapp.com/api/auth/' ,
  //       receiveDataWhenStatusError: true,
  //     ),
  //   );
  // }

  // static Future<Response>postData({@required String url,Map<String,dynamic> query,@required Map<String,dynamic> data,}) async{
  //   return dio.post(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }


  Future postHttpData({@required var body, @required String url,}) async {
    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
