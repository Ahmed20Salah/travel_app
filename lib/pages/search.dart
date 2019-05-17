import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Color.fromRGBO(21, 21, 21, .8),
        constraints: BoxConstraints.expand(),
      ),
      Container(
        height: 300.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/adventure.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken))),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Search'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(top: 101.0),
              margin: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              height: 250.0,
              width: 400.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('assets/dawn.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.6), BlendMode.darken))),
              child: Column(
                children: <Widget>[
                  Text(
                    'SEARCH',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.grey],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    margin: EdgeInsets.only(top: 65.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Search',
                          border: InputBorder.none,
                          suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: () => debugPrint('search'),),
                          contentPadding: EdgeInsets.all(10.0)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
