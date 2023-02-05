import 'dart:convert';

import 'package:flutter03_delivery/models/api_response.dart';
import 'package:flutter03_delivery/utils/base_url.dart';
import 'package:http/http.dart';

class RegistroService{

  Future<ApiResponse> registroUser(Map<String,dynamic> cliente) async{
      ApiResponse _apiResponse = ApiResponse();

      //Dentro del post hay que pasar varias cosas:
      //1. La url del endpoint al que vamos a atacar -> parsearlo de Uri
      //2. El json que queremos enviar que lo codificaremos a partir del map
      //3. headers que son las cabeceras que entre cosas indican que tipo
      //de contenido maneja la peticion -> json
      Response res = await post(Uri.parse('${baseUrl}user/'),
        body: json.encode(cliente),
        headers: {
        'Content-Type': 'application/json'
        }

      );
      if(res.statusCode == 200){
        _apiResponse.error = false;
      }
      //Aqui no estoy controlando los codigos de erros, pero debería
      else{
        _apiResponse.error = true;
        _apiResponse.apiErrorMessage = 'Error, intentelo más tarde';
      }

      return _apiResponse;
  }
}