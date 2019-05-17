import 'package:flutter/material.dart';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import '../scope_models/post_scope.dart';

class Post extends StatelessWidget {
  final File _imageFile;

  Post(this._imageFile);

  @override
  Widget build(BuildContext context) {
    // https://us-central1-travel-project2020.cloudfunctions.net/storeImage
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          color: Color.fromRGBO(21, 21, 21, 0),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Demlyk',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 22.0),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    cursorColor: Theme.of(context).accentColor,
                    decoration: InputDecoration(
                        labelText: 'descripe your picture',
                        fillColor: Theme.of(context).accentColor),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _imageFile == null
                      ? Container()
                      : Container(
                          height: 280.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: FileImage(
                                  _imageFile,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'submite',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Theme.of(context).accentColor),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onTap: () {
                      //model.addPost(user, image, label)
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
