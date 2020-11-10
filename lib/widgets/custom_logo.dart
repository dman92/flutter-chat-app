import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({Key key, @required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(image: AssetImage('assets/tfh.png')),
            SizedBox(height: 20,),
            Text("The Freak Hunter",
              style : TextStyle(color: Colors.white, fontSize: 30)
            ),
            SizedBox(height: 10,),
            Text(this.titulo,
              style : TextStyle(color: Colors.white, fontSize: 30)
            ),
          ],
        )
      ),
    );
  }
}