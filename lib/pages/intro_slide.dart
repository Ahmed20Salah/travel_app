import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class Intro_slide extends StatelessWidget{
 List<Slide> _slides = [
   Slide(
     title: 'LETS START',
     pathImage: 'assets/rocket.jpg' ,
     backgroundColor: Color.fromRGBO(212, 91, 106, 1),
     description: 'If you really enjoy spending time your \nvaction or would like to try \nsometing new and exciting ',
     styleDescription: TextStyle(fontSize: 14),
     marginDescription: EdgeInsets.only(top: 100.0)
   ),
   Slide(
     title: 'SEARCH FLIGHT',
     pathImage: 'assets/plane.jpg',
     backgroundColor: Color.fromRGBO(212, 91, 106, 1),
    description: 'Learn hoe to improve your playing\nquality even overall understaing of\nonline gaming how you perform',
       styleDescription: TextStyle(fontSize: 14),
       marginDescription: EdgeInsets.only(top: 100.0)
   ),
   Slide(
       title: 'KEEP ENJOY',
       pathImage: 'assets/agreement.jpg',
       backgroundColor: Color.fromRGBO(212, 91, 106, 1),
       description: 'It is particularly annoying to get\nyounger kids cooperates during travel\nBut it is not thier fault',
       styleDescription: TextStyle(fontSize: 14),
       marginDescription: EdgeInsets.only(top: 100.0)
   )
 ];
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        slides: _slides,
        renderNextBtn: Container(),
      renderSkipBtn: Container(),
      renderPrevBtn: Container(),
      onDonePress: ()=> Navigator.of(context).pushReplacementNamed('auth'),
    );
  }
}