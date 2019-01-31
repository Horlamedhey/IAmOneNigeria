import 'package:flutter/material.dart';
//import 'package:iamonenigeria/pages/assetsForm.dart';

class Library extends StatefulWidget {
  Library({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LibraryState();
  }
}

class LibraryState extends State<Library> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);

  List<Map<String, dynamic>> _posts = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Center(
                child: _posts.length == 0
                    ? Text(
                        'You\'ve been too busy to post something!',
                        style: TextStyle(color: _secondaryTextColor),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 20.0),
                        itemCount: _posts.length,
                        itemBuilder: (BuildContext _context, int i) {
                          return Column(
                            children: <Widget>[
                              Container(
//                                height: 450,
                                margin: EdgeInsets.only(top: 10.0),
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  color: _secondaryColor,
                                  elevation: 25.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              _posts[i]['title'],
                                              style: TextStyle(
                                                  color: _secondaryTextColor,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'by ',
                                                  style: TextStyle(
                                                      color:
                                                          _secondaryTextColor,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                Text(
                                                  _posts[i]['author'],
                                                  style: TextStyle(
                                                      color:
                                                          _secondaryTextColor,
                                                      fontSize: 18.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: _primaryColor,
                                                blurRadius: 2.0,
                                                offset: Offset(0.0, 1.0))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15.0),
                                        height: 200,
                                        width: 200,
                                        child: Image.file(
                                          _posts[i]['image'],
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      Container(
                                        height: 1.0,
                                        margin: EdgeInsets.only(top: 15.0),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: _primaryColor,
                                                blurRadius: 2.0,
                                                offset: Offset(0.0, 1.0))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            left: 10.0,
                                            top: 5.0,
                                            right: 10.0,
                                            bottom: 15.0),
                                        margin: EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          _posts[i]['body'],
                                          overflow: _posts[i]['more']
                                              ? TextOverflow.clip
                                              : TextOverflow.ellipsis,
                                          maxLines: _posts[i]['more'] ? 7 : 3,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: _secondaryTextColor,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      ButtonBar(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RaisedButton(
                                              child: Text(
                                                _posts[i]['more']
                                                    ? 'Read Less'
                                                    : 'Read More',
                                                style: TextStyle(
                                                    color: _secondaryColor),
                                              ),
                                              color: _primaryColor,
                                              onPressed: () {
                                                setState(() {
                                                  _posts[i]['more'] =
                                                      !_posts[i]['more'];
                                                });
                                              }),
                                          Divider(),
                                          IconButton(
                                              color: _primaryColor,
                                              icon: Icon(Icons.info_outline),
                                              onPressed: () {
                                                _showInfo(_posts[i]);
                                              }),
                                          IconButton(
                                              color: _primaryColor,
                                              icon: Icon(Icons.edit),
                                              onPressed: () {}),
                                          IconButton(
                                              color: _primaryColor,
                                              icon: Icon(Icons.delete_outline),
                                              onPressed: () {
                                                _deleteBlog(i);
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ))),
        Positioned(
          child: FloatingActionButton(
            onPressed: () {
              _addBlog();
            },
            child: Icon(Icons.add),
            tooltip: 'Create Blog',
            elevation: 15.0,
            highlightElevation: 20.0,
          ),
          bottom: 20.0,
          right: 15.0,
        ),
      ],
    );
  }

  void _addBlog() async {
    var post = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlogForm();
        });
    if (post != null)
      setState(() {
        _posts.add(post);
      });
  }

  void _deleteBlog(i) {
    setState(() {
      _posts.removeAt(i);
    });
  }

  void _showInfo(post) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Container(
            padding: EdgeInsets.all(20.0),
            height: MediaQuery.of(context).size.height * 0.3,
            color: _secondaryColor,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.info_outline,
                  color: _secondaryTextColor,
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text(
                      'Title: ',
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      post['title'],
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text(
                      'Author: ',
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      post['author'],
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text(
                      'Created: ',
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      post['created'],
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Text(
                      'Modified: ',
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      post['edited'],
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
