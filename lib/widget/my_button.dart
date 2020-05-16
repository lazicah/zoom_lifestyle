import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key key,
      @required this.title,
      @required this.color,
      this.onPressed,
      this.txtcolor = Colors.white})
      : super(key: key);

  final String title;
  final Color color;
  final Color txtcolor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: 100,
        height: 50,
        child: RaisedButton(
          color: color,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: txtcolor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
