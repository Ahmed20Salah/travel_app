import 'package:flutter/material.dart';


class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(child: Center(child: Text('Search Page'),),),
    );
  }
}