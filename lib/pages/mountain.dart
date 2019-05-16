import 'package:flutter/material.dart';

import '../widget/divider.dart';

class Mountain extends StatefulWidget {
  final String _title;
  final String _image;

  Mountain(this._title, this._image);

  @override
  State<StatefulWidget> createState() {
    return StateMountain();
  }
}

class StateMountain extends State<Mountain> {
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(25, 25, 25, 1),
          constraints: BoxConstraints.expand(),
        ),
        Container(
          constraints: BoxConstraints.expand(height: 350.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/${widget._image}.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.55), BlendMode.darken))),
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
                child: Text(
                  widget._title,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 50.0),
                child: Container(
                    margin: EdgeInsetsDirectional.only(bottom: 6.0),
                    child: Text(
                      'Family Safari Vacation To The Home of Gods \nTravel health useful medical information \nfor good health be',
                      style: customStyle(),
                      textAlign: TextAlign.center,
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 2, color: Color.fromRGBO(36, 36, 36, 1)),
                ),
                width: 200.0,
                margin: EdgeInsets.only(right: 200.0, left: 20.0, bottom: 50.0),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _favorite = !_favorite;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          _favorite ? Icons.favorite : Icons.favorite_border,
                          color: Color.fromRGBO(233, 112, 131, 1),
                        ),
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        'Add Favorite',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Details.',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      width: 20.0,
                      height: 2.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 60.0),
                      child: Text(
                        'Family Safari Vacation To The Home of Gods Travel health useful medical information for good health be '
                            'Family Safari Vacation To The Home of Gods Travel health useful medical information for good health be',
                        style: TextStyle(
                            fontSize: 17, color: Colors.white.withOpacity(.2)),
                      ),
                    ),
                    Text(
                      'History.',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      width: 20.0,
                      height: 2.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 60.0),
                      child: Text(
                        'Family Safari Vacation To The Home of Gods Travel health useful medical information for good health be '
                            'Family Safari Vacation To The Home of Gods Travel health useful medical information for good health be',
                        style: TextStyle(
                            fontSize: 17, color: Colors.white.withOpacity(.2)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextStyle customStyle() {
  return TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(255, 255, 255, .4),
  );
}
