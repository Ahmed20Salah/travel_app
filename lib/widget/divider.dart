import 'package:flutter/material.dart';

class OurDivider extends StatelessWidget{
  Color pint ;
  OurDivider({pint});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.symmetric(horizontal: 20.0 , vertical: 5.0),
      alignment: Alignment.center,
      color: pint == null ? Colors.grey : pint,
      height: 1.0,
      width: 371.0,
    );
  }
}