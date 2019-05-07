import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';


import '../models/auth.dart';

class UserScope extends Model {
  PublishSubject<bool> userSubject = PublishSubject();
  Future<Map<String, dynamic>> authenticate(
      {@required email, @required password, @required auth}) async {
    SharedPreferences setUserData = await SharedPreferences.getInstance();
    Map<String, dynamic> _authData = {
      'email': email,
      'password': password,
      'returnScureToken': true
    };
    http.Response response;
    if (auth == Auth.SignUp) {
      response = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyALjdIuwdUVelTjSpTFoOrFBKj7awDy9b4',
        body: json.encode(_authData),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      response = await http.post(
          'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyALjdIuwdUVelTjSpTFoOrFBKj7awDy9b4',
          body: json.encode(_authData),
          headers: {'Content-Type': 'application/json'});
    }
    print(response.body);
    Map<String, dynamic> responseData = json.decode(response.body);

    bool hasError = true;
    String message = 'authnitecated';
    if (responseData.containsKey('idToken')) {
      hasError = false;
      userSubject.add(true);
      setUserData.setString('email', responseData['eamil']);
      setUserData.setString('token', responseData['idToken']);
      setUserData.setString('expiresIn', responseData['expiresIn']);
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'This Email is already Exists!';
    }
    else if(responseData['error']['message'] == 'EMAIL_NOT_FOUND'){
      message = 'Email not found!';
    }
    else if(responseData['error']['message'] == 'INVALID_PASSWORD'){
      message = 'Invaild Password';
      }
      return{
      'success' : !hasError,
        'message': message
      };
  }

  void autoAuthenticate()async{
    SharedPreferences getUserData = await SharedPreferences.getInstance();
    String token =  getUserData.getString('token');
    if(token!=null){
      userSubject.add(true);
      print('got it');
      print(token);
    }
  }
}
