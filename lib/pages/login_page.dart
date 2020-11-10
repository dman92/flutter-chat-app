import 'package:chat_app/widgets/btn_pink.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/custom_labels.dart';
import 'package:chat_app/widgets/custom_logo.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff020202),
      body: SafeArea(
        child: SingleChildScrollView( // utilizamos esto para que no se amontonen
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: "Chat",),
                _Form(),
                Labels(
                  ruta: 'register',
                  subtitulo: "¿No tienes cuenta?",
                  titulo: 'Crea una ahora!',),
                Text('Terminos y condiciones de uso', style: TextStyle(color: Colors.white38))
              ],
            ),
          ),
        ),
      )
   );
  }
}


class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal:50),
      child: Column(
        children: <Widget>[
          
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            textController: passCtrl,
          ),

          //TODO: Crear boton
          BtnPink( 
            text:'Entrar',
            fcn: (){print("hola");}
          ),

        ],
      )
    );
  }
}

