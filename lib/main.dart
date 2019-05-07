import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'scope_models/users_scope.dart';

import 'home.dart';
import 'pages/auth.dart';
main() {
//  debugPaintSizeEnabled = true;
  runApp(App());
}

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  final UserScope model = UserScope();
  bool auth = false;
  @override
  void initState() {
    model.autoAuthenticate();
    model.userSubject.listen((bool event){
      setState(() {
          auth = event;
      });
    });
    super.initState();
  }

  void update(){
    setState(() {
      auth = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: auth ? Home() : Authenticate(),
        routes: {
          'home' : (BuildContext context) => Home(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
            accentColor: Color.fromRGBO(221, 103, 119,1)
        )
    );
  }
}
