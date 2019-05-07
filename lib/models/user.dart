import 'package:flutter/material.dart';
import 'posts.dart';

class Users {
  final String userName;
  final String userEmail;
  final String token;
  String picture;
  Posts userPosts;
  Posts userLikes;

  Users(
      {@required this.userName,
      @required this.userEmail,
      this.token,
      this.picture,
      this.userPosts,
      this.userLikes});
}
