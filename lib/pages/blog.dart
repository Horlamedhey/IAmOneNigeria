import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  Blog({Key key, this.posts, this.showInfo, this.deleteBlog}) : super(key: key);
  final List<Map<String, dynamic>> posts;
  final showInfo;
  final deleteBlog;
  @override
  State<StatefulWidget> createState() {
    return BlogState();
  }
}

class BlogState extends State<Blog> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20.0),
      itemCount: widget.posts.length,
      itemBuilder: (BuildContext _context, int i) {
        return Column(
          children: <Widget>[
            Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.posts[i]['title'],
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
                                    color: _secondaryTextColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                widget.posts[i]['author'],
                                style: TextStyle(
                                    color: _secondaryTextColor,
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300),
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
                        widget.posts[i]['image'],
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
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 10.0, bottom: 15.0),
                      margin: EdgeInsets.only(top: 15.0),
                      child: Text(
                        widget.posts[i]['body'],
                        overflow: widget.posts[i]['more']
                            ? TextOverflow.clip
                            : TextOverflow.ellipsis,
                        maxLines: widget.posts[i]['more'] ? 7 : 3,
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
                              widget.posts[i]['more']
                                  ? 'Read Less'
                                  : 'Read More',
                              style: TextStyle(color: _secondaryColor),
                            ),
                            color: _primaryColor,
                            onPressed: () {
                              setState(() {
                                widget.posts[i]['more'] =
                                    !widget.posts[i]['more'];
                              });
                            }),
                        Divider(),
                        IconButton(
                            color: _primaryColor,
                            icon: Icon(Icons.info_outline),
                            onPressed: () {
                              widget.showInfo(widget.posts[i]);
                            }),
                        IconButton(
                            color: _primaryColor,
                            icon: Icon(Icons.edit),
                            onPressed: () {}),
                        IconButton(
                            color: _primaryColor,
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                              widget.deleteBlog(i);
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
    );
  }
}
