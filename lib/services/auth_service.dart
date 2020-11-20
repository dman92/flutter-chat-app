import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usuario.dart';


class AuthService with ChangeNotifier{

  //  Analizar como nuestro backend va a reaccionar a nuestras peticiones
  Usuario usuario;

  Future login( String email, String password ) async {

    final data = {
      'email'   : email,
      'password': password,
    };

    final resp = await http.post('${ Enviroment.apiUrl }/login', 
      body: jsonEncode(data),
      headers: {
        'Content-Type' : 'application/json'
      }
    );

    print( resp.body );
    
    if (resp.statusCode == 200) {
      
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;

    }

  }


}