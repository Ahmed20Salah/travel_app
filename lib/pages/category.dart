import 'package:flutter/material.dart';

import '../widget/divider.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        color: Color.fromRGBO(21, 21, 21, 1),
        constraints: BoxConstraints.expand(),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white70.withOpacity(0.0),
          title: Text(
            'Demlyk',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 22.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                OurDivider(),
                Container(
                  padding: EdgeInsets.only(top: 70.0, bottom: 60.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Choose & Discover',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Colors.white),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 18.0),
                        child: Text(
                          'Family Safari Vacation To The Home of The Gods \n Travel health useful medical information \n for good health be',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white54, fontSize: 17, height: 1.2),
                        ),
                      ),
                      mountain(context),
                      _landscape(context),
                      _city(context),
                      _sea(context),
                      _culture(context),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }

  Widget mountain(BuildContext context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Color.fromRGBO(255, 255, 255, .3)),
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(0, 0, 0, 0),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, 'mountainIn');
        },
        leading: Container(
          child: Image.asset('assets/icons/mountain.png'),
          width: 110.0,
        ),
        title: Container(
          height: 60.0,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text('MOUNTAIN'),
        ),
        subtitle: Container(
          height: 60.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How Great Is ',
              ),
              Text('Strength of Your Belief')
            ],
          ),
        ),
      ),
    );
  }

  Widget _landscape(context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Color.fromRGBO(255, 255, 255, .3)),
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(0, 0, 0, 0),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: (){
          showDialog(context: context, builder: (context) => AlertDialog(
            title:Text('sorry this closed'),
            content: Text('this still under developing you can try "Mountain"'),

          ),);
        },
        leading: Container(
          child: Image.asset('assets/icons/air-balloon-96.png'),
          width: 110.0,
        ),
        title: Container(
          height: 60.0,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text('LANDSCAPE'),
        ),
        subtitle: Container(
          height: 60.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Always Look in The ',
              ),
              Text('Bright Side of Life')
            ],
          ),
        ),
      ),
    );
  }

  Widget _city(context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Color.fromRGBO(255, 255, 255, .3)),
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(0, 0, 0, 0),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: (){
          showDialog(context: context, builder:(context) =>  AlertDialog(
            title:Text('sorry this closed'),
            content: Text('this still under developing  you can try "Mountain"'),

          ),);
        },
        leading: Container(
          child: Image.asset('assets/icons/city-100.png'),
          width: 110.0,
        ),
        title: Container(
          height: 60.0,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text('CITY'),
        ),
        subtitle: Container(
          height: 60.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Life Advice Loking',
              ),
              Text('Through A Window')
            ],
          ),
        ),
      ),
    );
  }

  Widget _sea(context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Color.fromRGBO(255, 255, 255, .3)),
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(0, 0, 0, 0),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: (){
          showDialog(context: context, builder:(context) =>  AlertDialog(
            title:Text('sorry this closed'),
            content: Text('this still under developing you can try "Mountain"'),

          ),);
        },
        leading: Container(
          child: Image.asset('assets/icons/transportation-96.png'),
          width: 110.0,
        ),
        title: Container(
          height: 60.0,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text('SEA'),
        ),
        subtitle: Container(
          height: 60.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Five Tips For Low Cost',
              ),
              Text('Holidays')
            ],
          ),
        ),
      ),
    );
  }

  Widget _culture(context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: Color.fromRGBO(255, 255, 255, .3)),
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromRGBO(0, 0, 0, 0),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: (){
          showDialog(context: context, builder:(context) => AlertDialog(
            title:Text('sorry this closed'),
            content: Text('this still under developing you can try "Mountain"'),

          ),);
        },
        leading: Container(
          child: Image.asset('assets/icons/physics-book.png'),
          width: 110.0,
        ),
        title: Container(
          height: 60.0,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text('Culture'),
        ),
        subtitle: Container(
          height: 60.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Get Ready Fast For Fall',
              ),
              Text('Leaf Viewing Tips')
            ],
          ),
        ),
      ),
    );
  }
}
