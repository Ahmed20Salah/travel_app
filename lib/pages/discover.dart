import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widget/divider.dart';

import '../scope_models/post_scope.dart';

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
  Post_scope _model = Post_scope();

  Expend _statue = Expend.all;
  int _index;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          _statue = Expend.all;
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(21, 21, 21, 1),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/adventure.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.darken))),
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
            body: ScopedModel<Post_scope>(
              model: Post_scope(),
              child: Container(
                color: Colors.transparent,
                child: ScopedModelDescendant(
                    builder: (BuildContext context, Widget child,
                            Post_scope _model) =>
                        _statue == Expend.all ? _allPosts() : _singlePost()),
              ),
            ),
          )
        ],
      ),
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
              _userRow(user: _model.getPosts[index].user),
              // this for image upload
              Container(
                height: 250.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Container(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${_model.getPosts[_index].image}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey),
                ),
              ),

              //this for like , share , comment bar
              _detailsBar(model: _model, index: index),
              OurDivider(
                pint: Colors.red,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.only(top: 13),
                child: Text(
                  _model.getPosts[index].label,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _statue = Expend.all;
                      _index = index;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.settings_backup_restore,
                        size: 30,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      Text(' back to posts',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.grey))
                    ],
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
        itemCount: _model.getPosts.length,
        itemBuilder: (context, int index) {
          return Column(
            children: <Widget>[
              // this for user details
              _userRow(user: _model.getPosts[index].user),
              // this for image upload
              Container(
                height: 250.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Container(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${_model.getPosts[index].image}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey),
                ),
              ),

              //this for like , share , comment bar
              _detailsBar(model: _model, index: index),
              OurDivider(
                pint: Colors.red,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.only(top: 13),
                child: Text(
                  _model.getPosts[index].label,
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
                      _statue = Expend.single;
                      _index = index;
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
          itemCount: _model.comments.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
                _userRow(user: _model.comments[index].user),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20.0, right: 40.0),
                  child: Text(
                    _model.comments[index].comment,
                    style: TextStyle(color: Colors.grey),
                  ),
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

  Widget _detailsBar({Post_scope model, int index}) {
    bool isFavorite = _model.getPosts[index].favorite;
    return ScopedModelDescendant<Post_scope>(
      builder: (BuildContext context, Widget child, Post_scope model) =>
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Color.fromRGBO(233, 112, 131, 1),
                        ),
                        onTap: () {
                          setState(() {
                            _model.isFavorite(index, !isFavorite);
                          });
                        }),
                    InkWell(
                      child: Text(
                        '${_model.getPosts[index].likes.toString()} Likes',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(233, 112, 131, 1)),
                      ),
                      onTap: () {},
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
          ),
    );
  }
}
