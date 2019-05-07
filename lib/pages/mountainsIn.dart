import 'package:flutter/material.dart';

import '../widget/divider.dart';
import './mountains.dart';
import 'mountain.dart';

class MountainsIn extends StatelessWidget {
  final List<String> titles = [
    'Grand Canyon',
    'Machu Picchu',
    'Yosamite',
    'Viedma Glacier',
    'Talkeetna'
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> data = {
      'In Europe': [
        'Finland',
        'Finland',
        'Finland',
        'Finland',
        'Finland',
        'Finland'
      ],
      'In America': ['Mexica', 'Unitedstate', 'Finland'],
      'In Middle East': ['Finland', 'Mexica', 'Unitedstate', 'Finland'],
      'In Asia': ['China', 'Finland', 'Sweden'],
    };
    List<String> imageUrlEurope = [
      'adventure',
      'alp',
      'bird-',
      'blue-sky-',
      'adventure-clouds',
      'ceresole',
    ];
    List<String> imageUrlAmerica = [
      'blue-sky-',
      'adventure-clouds',
      'ceresole',
      'foggy',
      'adventure',
      'alp'
    ];
    List<String> imageUrlAsia = [
      'dawn-desktop-',
      'daylight',
      'foggy',
      'blue-sky-',
      'adventure',
      'alp'
    ];
    List<String> imageUrlMid = [
      'landscape',
      'guy-high',
      'foggy',
      'blue-sky-',
      'adventure',
      'alp'
    ];

    List<String> name = data.keys.toList();

    return Container(
      color: Color.fromRGBO(25, 25, 25, 1),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/adventure-clouds.jpg'),
              fit: BoxFit.cover,
            )),
            height: 310.0,
            child: Container(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Demlyk'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Container(
              child: ListView(
                children: <Widget>[
                  OurDivider(),
                  SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 100.0),
                    child: Text(
                      'Mountain In World',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 38),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    child: _buildHorizonticalListview(
                        name[0], data['In Europe'], imageUrlEurope, context),
                  ),
                  Container(
                    child: _buildHorizonticalListview(
                        name[1], data['In America'], imageUrlAmerica, context),
                  ),
                  Container(
                    child: _buildHorizonticalListview(
                        name[2], data['In Middle East'], imageUrlMid, context),
                  ),
                  Container(
                    child: _buildHorizonticalListview(
                        name[0], data['In Asia'], imageUrlAsia, context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHorizonticalListview(String title, List<String> mountainName,
      List<String> mountainImages, context) {
    return Column(
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 40.0, left: 15.0, right: 10.0, bottom: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Mountains(title)));
                  },
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 17),
                  ),
                  color: Color.fromRGBO(221, 103, 119, 1),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))
            ],
          ),
        ),
        Container(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mountainName.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Mountain(
                                    mountainName[index],
                                    mountainImages[index])));
                      },
                      child: Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/${mountainImages[index]}.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.colorDodge)),
                            borderRadius: BorderRadius.circular(10.0)),
                        width: 220.0,
                      )),
                  SizedBox(width: 10.0),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
