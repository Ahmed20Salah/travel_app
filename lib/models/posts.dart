import 'package:flutter/material.dart';
import 'user.dart';

class Posts {
  Users user;
  String image;
  int likes = 0;
  String label;
  bool favorite ;
  Posts({@required this.user, @required this.image, this.likes, this.label , this.favorite = false});
}
class Comments{
  Users user;
  String comment;

  Comments(this.user , this.comment);
}
