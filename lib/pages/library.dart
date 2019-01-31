import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  Library({Key key, this.books, this.showInfo, this.deleteBook})
      : super(key: key);
  final List<Map<String, dynamic>> books;
  final showInfo;
  final deleteBook;
  @override
  State<StatefulWidget> createState() {
    return LibraryState();
  }
}

class LibraryState extends State<Library> {
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
      itemCount: widget.books.length,
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
                            widget.books[i]['title'],
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
                                widget.books[i]['author'],
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
                        widget.books[i]['cover'],
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
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                            child: Text(
                              'Read Book',
                              style: TextStyle(color: _secondaryColor),
                            ),
                            color: _primaryColor,
                            onPressed: () {}),
                        Divider(),
                        Row(
                          children: <Widget>[
                            IconButton(
                                color: _primaryColor,
                                icon: Icon(Icons.info_outline),
                                onPressed: () {
                                  widget.showInfo(widget.books[i]);
                                }),
                            IconButton(
                                color: _primaryColor,
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {
                                  widget.deleteBook(i);
                                }),
                          ],
                        )
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
