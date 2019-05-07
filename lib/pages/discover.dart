import 'package:flutter/material.dart';

import '../widget/divider.dart';

import '../models/posts.dart';
import '../models/mode.dart';
import '../models/user.dart';

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiscoverState();
  }
}

class DiscoverState extends State<Discover> {
  bool expend = false;
  Expend _statue = Expend.all;
  int _index;
  List<Posts> _posts = [
    Posts(
      user: Users(
          userName: 'AhmedSalah',
          userEmail: 'Ahmed@tes.com',
          picture: 'assets/home.jpg'),
      image: 'assets/home.jpg',
      label: 'this From My trip',
      likes: 10,
    ),
    Posts(
      user: Users(
          userName: 'AhmedSalah',
          userEmail: 'Ahmed@tes.com',
          picture: 'assets/home.jpg'),
      image: 'assets/home.jpg',
      label: 'this From My trip',
      likes: 10,
    ),
  ];
  final Comments _comments = Comments(
      user: Users(userName: 'ahmedsaka', userEmail: 'ahmed'),
      comment: 'this good');

  final Users _user = Users(userName: 'ahmed', userEmail: 'ahmed');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(21, 21, 21,1),
          constraints: BoxConstraints.expand(),
        ),
        Container(
          color: Colors.green,
          height: 300.0,
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            title: Text('Discover'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            color: Colors.transparent,
              child: _statue == Expend.all ? _allPosts() : _singlePost()),
        )
      ],
    );
  }

  Widget _singlePost() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Column(
            children: <Widget>[
              // this for user details
              _userRow(user: _posts[index].user), // this for image upload
              Container(
                height: 250.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Container(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${_posts[_index].image}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey),
                ),
              ),

              //this for like , share , comment bar
              _detailsBar(likes: _posts[_index].likes),
              OurDivider(
                pint: Colors.red,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.only(top: 13),
                child: Text(
                  _posts[index].label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 15,
                  ),
                ),
              ),
              _buildComment(),
              SizedBox(
                height: 60.0,
              )
            ],
          );
        });
  }

  Widget _allPosts() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _posts.length,
        itemBuilder: (context, int index) {
          return Column(
            children: <Widget>[
              // this for user details
              _userRow(user: _posts[index].user),
              // this for image upload
              Container(
                height: 250.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Container(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${_posts[index].image}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey),
                ),
              ),

              //this for like , share , comment bar
              _detailsBar(likes: _posts[index].likes),
              OurDivider(
                pint: Colors.red,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.only(top: 13),
                child: Text(
                  _posts[index].label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
//                      _statue = Expend.single;
                      _index = index;
                      debugPrint(_user.userName);
                      debugPrint(_comments.user.userName);
                      debugPrint(_comments.comment.toString());
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      Text(' See 3 comments',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.4)))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              )
            ],
          );
        });
  }

  Widget _buildComment() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _posts[_index].comments.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
//                _userRow(user: _posts[_index].comments[0].user),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20.0, right: 40.0),
//                  child: Text(
//                    _posts[_index].comments[index].comment,
//                    style: TextStyle(color: Colors.black12),
//                  ),
                )
              ],
            );
          }),
    );
  }

  Widget _userRow({Users user}) {
    return ListTile(
      leading: InkWell(
          onTap: null,
          child: CircleAvatar(
            backgroundImage: AssetImage(user.picture),
          )),
      title: Container(
        width: 20.0,
        alignment: Alignment.topLeft,
        child: InkWell(onTap: null, child: Text(user.userName)),
      ),
      subtitle: Text('0 min ago'),
    );
  }

  Widget _detailsBar({int likes = 0}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                  child: Icon(
                    Icons.favorite_border,
                    color: Color.fromRGBO(233, 112, 131, 1),
                  ),
                  onTap: null),
              InkWell(
                child: Text(
                  '${likes.toString()} Likes',
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(233, 112, 131, 1)),
                ),
                onTap: () => debugPrint('tapped'),
              ),
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                  child: Icon(
                    Icons.comment,
                    color: Color.fromRGBO(233, 112, 131, 1),
                  ),
                  onTap: null),
              InkWell(
                  child: Icon(
                    Icons.share,
                    color: Color.fromRGBO(233, 112, 131, 1),
                  ),
                  onTap: null),
            ],
          )
        ],
      ),
    );
  }
}
