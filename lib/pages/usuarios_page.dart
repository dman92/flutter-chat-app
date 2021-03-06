import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1', nombre: 'Maria',  email: 'test1@test.com', online: true),
    Usuario(uid: '2', nombre: 'Melisa', email: 'test2@test.com', online: false),
    Usuario(uid: '3', nombre: 'David',  email: 'test3@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Nombre'),
        elevation: 1,
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){},
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right:10),
            child: Icon( Icons.check_circle, color: Colors.greenAccent),
            //child: Icon( Icons.offline_bolt, color: Colors.yellow),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.pink),
          waterDropColor: Colors.pink,
        ),
        child: _listViewUsuarios(),
      )
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }


  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre, style: TextStyle(color: Colors.white)),
        subtitle: Text(usuario.email, style: TextStyle(color: Colors.white)),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2), style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.pink[300],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.greenAccent : Colors.grey,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }


  _cargarUsuarios() async {

    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();

  }


}