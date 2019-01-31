import 'package:flutter/material.dart';
import 'package:iamonenigeria/pages/assetsForm.dart';
import 'package:iamonenigeria/pages/blog.dart';
import 'package:iamonenigeria/pages/library.dart';

class LibBlog extends StatefulWidget {
  LibBlog({Key key, this.mode}) : super(key: key);
  final String mode;
  @override
  State<StatefulWidget> createState() {
    return LibBlogState();
  }
}

class LibBlogState extends State<LibBlog> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);

  Map<String, List<Map<String, dynamic>>> _assets =
      <String, List<Map<String, dynamic>>>{'posts': [], 'books': []};

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
                child: widget.mode == 'Blog'
                    ? _assets['posts'].length == 0
                        ? Text(
                            'You\'ve been too busy to post something!',
                            style: TextStyle(color: _secondaryTextColor),
                          )
                        : Blog(
                            posts: _assets['posts'],
                            showInfo: _showInfo,
                            deleteBlog: _deleteAsset,
                          )
                    : _assets['books'].length == 0
                        ? Text(
                            'You\'ve been too busy to share a book!',
                            style: TextStyle(color: _secondaryTextColor),
                          )
                        : Library(
                            books: _assets['books'],
                            showInfo: _showInfo,
                            deleteBook: _deleteAsset,
                          ))),
        Positioned(
          child: FloatingActionButton(
            onPressed: () {
              _addAsset();
            },
            child: Icon(Icons.add),
            tooltip: 'Create ${widget.mode}',
            elevation: 15.0,
            highlightElevation: 20.0,
          ),
          bottom: 20.0,
          right: 15.0,
        ),
      ],
    );
  }

  void _addAsset() async {
    var asset = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AssetsForm(
            asset: widget.mode == 'Blog' ? 'Blog Post' : 'Library Item',
            mode: widget.mode.toLowerCase(),
          );
        });
    if (asset != null) {
      if (widget.mode == 'Blog') {
        setState(() {
          _assets['posts'].add(asset);
        });
      } else if (widget.mode == 'Library') {
        setState(() {
          _assets['books'].add(asset);
        });
      }
    }
  }

  void _deleteAsset(i) {
    if (widget.mode == 'Blog') {
      setState(() {
        _assets['posts'].removeAt(i);
      });
    } else {
      setState(() {
        _assets['books'].removeAt(i);
      });
    }
  }

  void _showInfo(asset) {
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
                      asset['title'],
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
                      asset['author'],
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
                      widget.mode == 'Blog' ? 'Created: ' : 'Added: ',
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      widget.mode == 'Blog' ? asset['created'] : asset['added'],
                      style: TextStyle(
                          color: _secondaryTextColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Divider(),
                widget.mode == 'Blog'
                    ? Row(
                        children: <Widget>[
                          Text(
                            'Modified: ',
                            style: TextStyle(
                                color: _secondaryTextColor,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            asset['edited'],
                            style: TextStyle(
                                color: _secondaryTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
