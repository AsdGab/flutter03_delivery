import 'dart:convert';

import 'package:flutter03_delivery/models/api_response.dart';
import 'package:flutter03_delivery/utils/base_url.dart';
import 'package:http/http.dart';

class LoginService{

  Future<ApiResponse> loginUser(Map<String, dynamic> user) async {

    ApiResponse _apiResponse = ApiResponse();

    Response res = await post(
      Uri.parse(baseUrl+'login_check'),
      body: json.encode(user),
      headers: {'Content-Type': 'application/json'}
    );
    if(res.statusCode == 200){
      print(res.body);
    }else{
      _apiResponse.error= true;
      _apiResponse.apiErrorMessage = 'Error de credenciales';
    }
    return _apiResponse;
  }
}