import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:scoped_model/scoped_model.dart';
import 'scope_models/users_scope.dart';
import 'dart:io';

import 'pages/discover.dart';
import 'pages/search.dart';
import 'pages/category.dart';
import 'pages/mountainsIn.dart';
import 'pages/camer.dart';
import 'pages/auth.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final UserScope _model = UserScope();
  final Map<String, Function> pages = {
    '/discover': () => MaterialPageRoute(builder: (context) => Discover()),
    '/search': () => MaterialPageRoute(builder: (context) => Search()),
    'mountainIn': () => MaterialPageRoute(builder: (context) => MountainsIn()),
    '/': ()=>MaterialPageRoute(builder: (context) => Category())

  };

  Color _catagoryColor = Color.fromRGBO(221, 103, 119, 0);
  Color _discoverColor;
  Color _searchColor;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserScope>(
      model: _model,
      child: Scaffold(
        key: _globalKey,
        drawer: _drawer(),
        body: body(),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

// Material app in scaffold how has his own bottom bar and navigator
//
  Widget body() {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            accentColor: Color.fromRGBO(221, 103, 119, 1)),
        navigatorKey: navigatorKey,
        onGenerateRoute: (route) => pages[route.name]());
  }

// bottom bar navigator code
  Widget _bottomBar() {
    return BottomAppBar(
      color: Color.fromRGBO(37, 37, 37, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
        // list of iconButtons
        //
        // for show the drawer
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 3.0, color: Color.fromRGBO(37, 37, 37, 1)),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 32.0,
                color: Color.fromRGBO(121, 121, 121, 1),
              ),
              onPressed: () {
                _globalKey.currentState.openDrawer();
              },
            ),
          ),
//
//
// for main page
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 3.0,
                    color: _catagoryColor == null
                        ? Color.fromRGBO(37, 37, 37, 1)
                        : Theme.of(context).accentColor),
              ),
            ),
            child: IconButton(
                icon: Icon(Icons.apps,
                    color: _catagoryColor == null
                        ? Color.fromRGBO(121, 121, 121, 1)
                        : Theme.of(context).accentColor,
                    size: 32.0),
                onPressed: () {
                  setState(() {
                    _catagoryColor = Theme.of(context).accentColor;
                    print(_catagoryColor);
                    _discoverColor = null;
                    _searchColor = null;
                  });
                  navigatorKey.currentState
                      .pushReplacementNamed(pages.keys.toList()[3]);
                }),
          ),
//
// container here for decoration
// for location
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 3.0,
                    color: _discoverColor == null
                        ? Color.fromRGBO(37, 37, 37, 1)
                        : _discoverColor),
              ),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: _discoverColor == null
                      ? Color.fromRGBO(121, 121, 121, 1)
                      : _discoverColor,
                  size: 32,
                ),
                onPressed: () {
                  setState(() {
                    _discoverColor = Theme.of(context).accentColor;
                    _catagoryColor = null;
                    _searchColor = null;
                  });
                  navigatorKey.currentState
                      .pushReplacementNamed(pages.keys.toList()[0]);
                }),
          ),
//
//
// for search
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 3.0,
                    color: _searchColor == null
                        ? Color.fromRGBO(37, 37, 37, 1)
                        : _searchColor),
              ),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: _searchColor == null
                      ? Color.fromRGBO(121, 121, 121, 1)
                      : _searchColor,
                  size: 32.0,
                ),
                onPressed: () {
                  setState(() {
                    _searchColor = Theme.of(context).accentColor;
                    _catagoryColor = null;
                    _discoverColor = null;
                  });
                   navigatorKey.currentState.pushReplacementNamed(pages.keys.toList()[1]);
                }),
          ),
//
//
// for access cam
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 3.0,
                  color: Color.fromARGB(37, 37, 37, 1),
                ),
              ),
            ),
            child: IconButton(
                icon: Icon(Icons.camera_alt,
                    color: Color.fromRGBO(121, 121, 121, 1), size: 32.0),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 60.0, vertical: 30.0),
                            title: Text(
                              'Pick an Image',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    _imagePicker(context, ImageSource.camera);
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Theme.of(context).accentColor,
                                    size: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                IconButton(
                                    onPressed: () {
                                      _imagePicker(
                                          context, ImageSource.gallery);
                                    },
                                    icon: Icon(Icons.picture_in_picture,
                                        color: Theme.of(context).accentColor,
                                        size: 35.0))
                              ],
                            ));
                      });
                }),
          ),
        ],
      ),
    );
  }

  void _imagePicker(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source).then((File image) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Post(image)));
    });
  }

// for Drawer thing
  Widget _drawer() {
    return Drawer(
        child:ScopedModelDescendant(builder: (BuildContext context , Widget child , UserScope model) =>  Container(
          color: Color.fromRGBO(230, 107, 128, 1.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60.0),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        image: DecorationImage(image: AssetImage('assets/guy-high.jpg') , fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30.0)),
                    width: 60.0,
                    height: 60.0,
                  ),
                  title: Text(
                    'Ahmed Salah',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'ahmed@tes.com',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.apps,
                        size: 30.0,
                      ),
                      title: Text(
                        'Category',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        size: 30.0,
                      ),
                      title: Text(
                        'Near by Area',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        size: 30.0,
                      ),
                      title: Text(
                        'Notification',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.favorite,
                        size: 30.0,
                      ),
                      title: Text(
                        'Liked',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.image,
                        size: 30.0,
                      ),
                      title: Text(
                        'My Gallery',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 30.0,
                      ),
                      title: Text(
                        'Account Settings',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    ListTile(
                      onTap: () {
                        _model.logut();
                        Navigator.pushReplacementNamed(context, 'auth');
                      },
                      leading: Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),),
    );
  }
}
