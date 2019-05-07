import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scope_models/users_scope.dart';

import '../models/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthenticateState();
  }
}

class AuthenticateState extends State<Authenticate> {

  Auth _auth = Auth.Login;
  GlobalKey<FormState> _formState = GlobalKey();
  Map<String, dynamic> _formData = {
    'userName': null,
    'Email': null,
    'password': null,
  };



  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserScope>(
        model: UserScope(),
        child: ScopedModelDescendant(
            builder: (BuildContext context, Widget child, UserScope model) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(left: 80.0, right: 88.0, top: 130.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formState,
                    child: Column(
                      children: <Widget>[
                        Text(
                          _auth == Auth.Login ? ' Login' : 'SignUp',
                          style: TextStyle(
                              fontSize: 27.0, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        _auth == Auth.SignUp
                            ? TextFormField(
                                decoration: InputDecoration(labelText: 'Name'),
                                onSaved: (String value) {
                                  _formData['userName'] = value;
                                },
                                validator: (String value) {
                                  if (value.length == 0) {
                                    return 'pleease enter your name!';
                                  }
                                },
                              )
                            : Container(),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.isEmpty ||
                                !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                    .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                          },
                          onSaved: (String value) {
                            debugPrint(value);
                            _formData['Email'] = value;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (String value) {
                            if (value.isEmpty || value.length < 6) {
                              return 'short password';
                            }
                          },
                          onSaved: (String value) {
                            _formData['password'] = value;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: FlatButton(
                            onPressed: null,
                            child: Text('forgetPassword?'),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        _auth == Auth.Login
                            ? Container(
                                width: 190.0,
                                height: 46.0,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(213, 92, 107, 1),
                                  border:
                                      Border.all(color: Colors.grey, width: .5),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: FlatButton(
                                  onPressed: () => _submitForm(model),
                                  child: Text(
                                    'SIGIN',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              )
                            : Container(),
                        FlatButton(
                          onPressed: () => setState(() {
                                _auth == Auth.Login
                                    ? _auth = Auth.SignUp
                                    : _auth = Auth.Login;
                              }),
                          child: Text(
                            _auth == Auth.Login
                                ? 'No memeberShip?'
                                : 'have an account already!',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        Container(
                          width: 190.0,
                          height: 46.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: .5),
                              borderRadius: BorderRadius.circular(30.0),
                              color: _auth == Auth.Login
                                  ? Color.fromRGBO(0, 0, 0, 0)
                                  : Color.fromRGBO(213, 92, 107, 1)),
                          child: FlatButton(
                            onPressed: () => _submitForm(model),
                            child: Text('SIGUP',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }

  void _submitForm(model) async {
    if(!_formState.currentState.validate()){
      return;
    }
    print('submitform');
    _formState.currentState.save();
    Map<String, dynamic> response;
    response = await model.authenticate(
        email: _formData['Email'],
        password: _formData['password'],
        auth: _auth);
    if (response['success']) {
      debugPrint(response['message']);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(response['message']),
            title: Text('An Error Ocurred!'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('try again'))
            ],
          );
        },
      );
    }
  }
}
