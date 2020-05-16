import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomlifestyle/const.dart';
import 'package:zoomlifestyle/models/country_model.dart';
import 'package:zoomlifestyle/themes/light_color.dart';

class AuthScreen extends StatefulWidget {
  final int postion;
  AuthScreen({this.postion = 0});
  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final List<DropdownMenuItem<String>> _dropDown1 = kMenuItems1
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();

  final List<DropdownMenuItem<String>> _dropDown2 = kMenuItems2
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();

  final List<DropdownMenuItem<Country>> _dropDown3 = MyConstants.countryList
      .map((e) =>
          DropdownMenuItem<Country>(value: e, child: Text("+${e.phoneCode})")))
      .toList();

  final _textfieldController = TextEditingController();
  final _textfieldController2 = TextEditingController();
  final _textfieldController3 = TextEditingController();
  final _textfieldController4 = TextEditingController();
  final _textfieldController5 = TextEditingController();
  bool _showPassword = false;
  String choiceDropdownValue = kMenuItems1[0];
  String subscriptionValue = kMenuItems2[0];
  Country countryCode = MyConstants.countryList[0];

  Widget _dropDownChoice() {
    return DropdownButton<String>(
      value: choiceDropdownValue,
      icon: Icon(Icons.filter_list),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          choiceDropdownValue = newValue;
        });
      },
      items: _dropDown1,
    );
  }

  Widget _dropDownChoice2() {
    return DropdownButton<String>(
      value: subscriptionValue,
      icon: Icon(Icons.filter_list),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          subscriptionValue = newValue;
        });
      },
      items: _dropDown2,
    );
  }

  _buildCountryPickerDropdown(
          {bool filtered = false,
          bool sortedByIsoCode = false,
          bool hasPriorityList = false}) =>
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton<Country>(
                value: countryCode,
                icon: Icon(Icons.filter_list),
                iconSize: 24,
                elevation: 16,
                onChanged: (Country newValue) {
                  setState(() {
                    countryCode = newValue;
                  });
                },
                items: _dropDown3,
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              flex: 2,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: '08021234567', prefixIcon: Icon(Icons.phone)),
              ),
            )
          ],
        ),
      );

  Widget LoginPage() {
    return Material(
      child: new Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      maxLines: 3,
                    ),
                    Text(
                      'Sign in to your account to continue',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Theme(
                  data:
                      ThemeData.light().copyWith(primaryColor: LightColor.kRed),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LightColor.kRed, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LightColor.kRed, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Email/Phone Number',
                      hintStyle: TextStyle(color: LightColor.grey),
                    ),
                    controller: _textfieldController,
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Theme(
                  data:
                      ThemeData.light().copyWith(primaryColor: LightColor.kRed),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LightColor.kRed, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LightColor.kRed, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      prefixIcon: Icon(Icons.security),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: LightColor.grey),
                      suffixIcon: IconButton(
                          icon: Icon(!_showPassword
                              ? Icons.lock_outline
                              : Icons.lock_open),
                          onPressed: () {
                            setState(() {
                              this._showPassword = !this._showPassword;
                            });
                          }),
                    ),
                    obscureText: !_showPassword,
                    controller: _textfieldController2,
                  ),
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: new OutlineButton(
                      borderSide: BorderSide(color: LightColor.kRed),
                      child: new Text(
                        "Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightColor.kRed,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {gotoSignup()},
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: new FlatButton(
                      child: new Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightColor.kRed,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: new FlatButton(
                      child: new Text(
                        "Already paid before but have no account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightColor.kRed,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: LightColor.kRed,
                        onPressed: () => {},
                        child: new Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget SignupPage() {
    return Material(
      child: Container(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Text(
                  'Buy lottery Ticket to enter Raffle Draw',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  maxLines: 3,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Theme(
                  data:
                      ThemeData.light().copyWith(primaryColor: LightColor.kRed),
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Full Name', prefixIcon: Icon(Icons.person)),
                    controller: _textfieldController3,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Theme(
                  data:
                      ThemeData.light().copyWith(primaryColor: LightColor.kRed),
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Email Address'),
                    controller: _textfieldController3,
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Theme(
                  data:
                      ThemeData.light().copyWith(primaryColor: LightColor.kRed),
                  child: _buildCountryPickerDropdown(
                      filtered: false,
                      sortedByIsoCode: false,
                      hasPriorityList: false),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: LightColor.kRed)),
                      child: _dropDownChoice(),
                    ),
                    new Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: LightColor.kRed)),
                      child: _dropDownChoice2(),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: new FlatButton(
                      child: new Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightColor.kRed,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {gotoLogin()},
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                alignment: Alignment.center,
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Colors.green,
                  onPressed: () => {},
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Text(
                            "PAY NOW (NGN 500)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                alignment: Alignment.center,
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                    side: BorderSide(color: LightColor.kRed),
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () => {},
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Text(
                            "I have paid. I want to create an account only",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: LightColor.kRed,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceIn,
    );
  }

  PageController _controller =
      new PageController(initialPage: 0, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Color(0xFF736AB7),
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Hero(
                  tag: 'zoom',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        'Zoom ',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: LightColor.kRed),
                      ),
                      Text(
                        'Lifestyle',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 150.0),
                  child: PageView(
                    controller: _controller,
                    physics: new AlwaysScrollableScrollPhysics(),
                    children: <Widget>[LoginPage(), SignupPage()],
                    scrollDirection: Axis.horizontal,
                  )),
            ],
          )),
    ));
  }
}
