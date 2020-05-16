import 'package:flutter/material.dart';
import 'package:zoomlifestyle/screens/home_page.dart';
import 'package:zoomlifestyle/themes/light_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 3), upperBound: 1, vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    });

    controller.addListener(() {
      setState(() {
        print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LightColor.kRed,
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: animation.value * 100,
          child: Image(
            image: AssetImage('images/zoom-logo.png'),
          ),
        ),
      ),
    );
  }
}
