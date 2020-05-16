import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoomlifestyle/themes/light_color.dart';
import 'package:zoomlifestyle/widget/my_button.dart';

import '../const.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _current = 0;

  YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'wpeOVl_p3BQ',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.35,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: MyConstants.imgList
                    .map((item) => Container(
                          color: Colors.black,
                          child: Image(
                            image: NetworkImage(item.toString()),
                          ),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: MyConstants.imgList.map((url) {
                  int index = MyConstants.imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? LightColor.kRed : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              'Get Your Tickets \nto enter the Next ₦1 MILLION Draw!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              thickness: 1.0,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Text(
              'Zoom in four steps',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              maxLines: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            width: 50.0,
            height: 5.0,
            color: LightColor.kRed,
          ),
          SizedBox(
            height: 10.0,
          ),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          SizedBox(
            height: 10.0,
          ),
          StepText(
            text: 'Click Buy Raffle',
            number: '1',
          ),
          StepText(
            text: 'Fill your details and pay',
            number: '2',
          ),
          StepText(
            text: 'Check your email for your raffle tickets',
            number: '3',
          ),
          StepText(
            text: 'You are now eligible for the raffle draw!',
            number: '4',
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: MyButton(
              title: 'Buy Raffle',
              color: LightColor.kRed,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              thickness: 1.0,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Text(
              'Proudly Supported By',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              maxLines: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            width: 50.0,
            height: 5.0,
            color: LightColor.kRed,
          ),
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: MyConstants.imgList2
                .map((item) => Container(
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(item.toString()),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }
}

class StepText extends StatelessWidget {
  const StepText({Key key, this.text, this.number}) : super(key: key);

  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(
              number,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: LightColor.kRed,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              text,
              softWrap: true,
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
