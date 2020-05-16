import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
    this.icon,
    @required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon != null ? Icon(icon) : SizedBox(),
          SizedBox(
            width: 16.0,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
