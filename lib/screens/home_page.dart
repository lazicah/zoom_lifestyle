import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomlifestyle/screens/authorisation_screen.dart';
import 'package:zoomlifestyle/screens/home_body.dart';
import 'package:zoomlifestyle/themes/light_color.dart';
import 'package:zoomlifestyle/widget/menu_button.dart';
import 'package:zoomlifestyle/widget/my_button.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBorderRadius: BorderRadius.zero,
      stickyFrontLayer: true,
      resizeToAvoidBottomInset: false,
      frontLayer: HomePageBody(),
      backLayer: BackdropNavigationBackLayer(items: [
        MenuButton(title: 'Home', icon: Icons.home),
        ExpansionTile(
          title: MenuButton(title: 'ZOOM NATION'),
          children: <Widget>[
            MenuButton(title: 'Treasure Hunt', icon: Icons.attach_money),
            MenuButton(title: 'Zoom Trivia', icon: Icons.videogame_asset),
          ],
        ),
        MenuButton(title: 'UPLOAD', icon: Icons.cloud_upload),
        MenuButton(title: 'FAQS', icon: Icons.question_answer),
        MenuButton(title: 'CONTACT US', icon: Icons.contact_mail),
        MyButton(
          title: 'Buy Raffle',
          color: LightColor.kRed,
          onPressed: () {},
        ),
        MyButton(
          title: 'Sign-In',
          color: LightColor.yellowColor,
          txtcolor: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AuthScreen()));
          },
        ),
      ]),
      iconPosition: BackdropIconPosition.action,
      title: Hero(
        tag: 'zoom',
        child: Row(
          children: <Widget>[
            Text(
              'Zoom ',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: LightColor.kRed),
            ),
            Text(
              'Lifestyle',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
