import 'package:flutter/material.dart';

import 'mountain.dart';

import '../widget/divider.dart';

class Mountains extends StatelessWidget {
  final String title;
  final List<String> titles = [
    'Grand Canyon',
    'Machu Picchu',
    'Yosamite',
    'Viedma Glacier',
    'Talkeetna'
  ];

  Mountains(this.title);

  final List<String> _imageUrl = [
    'alp',
    'adventure',
    'desktop-wallpape',
    'landscape',
    'blue-sky-'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(25, 25, 25, 1),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 350.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/adventure.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.65), BlendMode.luminosity))),
            child: Container(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Text('Mountains'),
              centerTitle: true,
            ),
            body: ListView(
              children: <Widget>[
                OurDivider(),
                SizedBox(
                  height: 300.0,
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 30.0),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 90.0),
                  child: Text(
                    'Mountain $title',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 50.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsetsDirectional.only(bottom: 6.0),
                          child: Text(
                            'Family Safari Vacation To The Home of Gods',
                            style: customStyle(),
                          )),
                      Container(
                          margin: EdgeInsetsDirectional.only(bottom: 6.0),
                          child: Text(
                            'Travel health useful medical information',
                            style: customStyle(),
                          )),
                      Container(
                        child: Text(
                          'for good health be',
                          style: customStyle(),
                        ),
                      )
                    ],
                  ),
                ),
                _mountainContainer(titles[0], _imageUrl[0], context),
                SizedBox(
                  height: 20.0,
                ),
                _mountainContainer(titles[1], _imageUrl[1], context),
                SizedBox(
                  height: 20.0,
                ),
                _mountainContainer(titles[2], _imageUrl[2], context),
                SizedBox(
                  height: 20.0,
                ),
                _mountainContainer(titles[3], _imageUrl[3], context),
                SizedBox(
                  height: 20.0,
                ),
                _mountainContainer(titles[4], _imageUrl[4], context),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mountainContainer(String name, String title, context) {
    return FlatButton(
      color: Colors.transparent,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Mountain(name , title)));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$title.jpg'), fit: BoxFit.cover ,colorFilter: ColorFilter.mode(Colors.black.withOpacity(.8), BlendMode.dstOver)),
            color: Colors.green,
            borderRadius: BorderRadius.circular(10.0)),
        height: 150.0,
        width: 400.0,
        child: Container(
          margin: EdgeInsets.only(left: 20.0, top: 90.0),
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                width: 30.0,
                height: 2.0,
                margin: EdgeInsets.only(bottom: 6.0),
              ),
              Container(
                  child: Text(
                name,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              )),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle customStyle() {
    return TextStyle(
      fontSize: 16,
      color: Color.fromRGBO(255, 255, 255, .4),
    );
  }
}
