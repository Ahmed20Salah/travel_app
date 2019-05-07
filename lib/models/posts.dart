import 'package:flutter/material.dart';
import 'user.dart';

class Posts {
  Users user;
  String image;
  int likes;
  String label;
  // Map of index and list of dynamic user data , comment
  List<Comments> comments;
  // comments and likes not required because they are dynamic values
  Posts({@required this.user, @required this.image, this.likes, this.comments , this.label});
}
class Comments{
  Users user;
  String comment;
  List<Comments> replays;
  Comments({@required user , @required comment});
}
