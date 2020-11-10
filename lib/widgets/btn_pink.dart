import 'package:flutter/material.dart';

class BtnPink extends StatelessWidget {

  final String text;
  final Function fcn;

  const BtnPink({
      Key key, 
      @required this.fcn,
      @required this.text
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.pink,
      shape: StadiumBorder(),
      onPressed: this.fcn,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(child: Text(this.text, style: TextStyle(color:Colors.white, fontSize: 18),),),
      ),
    );
  }
}