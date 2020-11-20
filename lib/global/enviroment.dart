import 'dart:io';

//Nos creamos una clase que solo tenga metodos estáticos
// vamos a poder acceder a ellos sin instanciar la clase


class Enviroment {

  static String apiUrl    = Platform.isAndroid ? 'http://192.168.1.158:3000/api': 'http://localhost:3000/api'; 
  static String socketUrl = Platform.isAndroid ? 'http://192.168.1.158:3000': 'http://localhost:3000'; 


}