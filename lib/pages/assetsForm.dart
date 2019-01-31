import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AssetsForm extends StatefulWidget {
  AssetsForm({Key key, this.asset, this.mode});
  final String asset;
  final String mode;
  @override
  AssetsFormState createState() => new AssetsFormState();
}

class AssetsFormState extends State<AssetsForm> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);
  bool _imageExp = false;
  bool _bookExp = false;
  Map<String, dynamic> _post = {};
  Map<String, dynamic> _newBook = {};
  FocusNode focusNode = new FocusNode();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  String _image = '';
  String _book = '';
  TextEditingController _bodyController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _post = {};
    _newBook = {};
    _titleController.text = '';
    _authorController.text = '';
    _bodyController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.all(0.0),
        content: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(focusNode),
          child: Container(
              color: _secondaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'New ${widget.asset}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: _secondaryTextColor),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Column(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(
                              cursorColor: _primaryColor,
                              hintColor: _secondaryTextColor,
                              textSelectionColor: _secondaryTextColor,
                              inputDecorationTheme: InputDecorationTheme(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: _primaryColor)))),
                          child: TextFormField(
                            controller: _titleController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: _primaryColor),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(15.0),
                              labelStyle: TextStyle(color: _secondaryTextColor),
                              border: OutlineInputBorder(),
                              labelText: "Title",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Theme(
                            data: ThemeData(
                                cursorColor: _primaryColor,
                                hintColor: _secondaryTextColor,
                                textSelectionColor: _secondaryTextColor,
                                inputDecorationTheme: InputDecorationTheme(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: _primaryColor)))),
                            child: TextFormField(
                              controller: _authorController,
                              style: TextStyle(color: _primaryColor),
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(15.0),
                                labelStyle:
                                    TextStyle(color: _secondaryTextColor),
                                border: OutlineInputBorder(),
                                labelText: "Author",
                              ),
                              keyboardType: TextInputType.text,
                            )),
                        SizedBox(
                          height: 15.0,
                        ),
                        RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            color: _secondaryTextColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(
                                  Icons.image,
                                  color: _secondaryColor,
                                ),
                                widget.mode == 'blog'
                                    ? Text(
                                        'Select an Image',
                                        style:
                                            TextStyle(color: _secondaryColor),
                                      )
                                    : Text(
                                        'Select a Book Cover',
                                        style:
                                            TextStyle(color: _secondaryColor),
                                      ),
                                IconButton(
                                    icon: _imageExp
                                        ? Icon(
                                            Icons.keyboard_arrow_up,
                                            color: _secondaryColor,
                                          )
                                        : Icon(
                                            Icons.keyboard_arrow_down,
                                            color: _secondaryColor,
                                          ),
                                    onPressed: null),
                              ],
                            ),
                            onPressed: () {
                              pickImage();
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                _imageExp
                                    ? Container(
                                        width: 200,
                                        height: 200,
                                        child: Image.file(
                                          File(_image),
                                          fit: BoxFit.scaleDown,
                                        ))
                                    : Container(),
                                Positioned(
                                    right: 0,
                                    child: IconButton(
                                        color: _primaryColor,
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          removeImage();
                                        }))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        widget.mode == 'blog'
                            ? Theme(
                                data: ThemeData(
                                    cursorColor: _primaryColor,
                                    hintColor: _secondaryTextColor,
                                    textSelectionColor: _secondaryTextColor,
                                    inputDecorationTheme: InputDecorationTheme(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: _primaryColor)))),
                                child: TextFormField(
                                  controller: _bodyController,
                                  maxLines: 7,
                                  style: TextStyle(color: _primaryColor),
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.all(15.0),
                                    labelStyle:
                                        TextStyle(color: _secondaryTextColor),
                                    labelText: "Body",
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                ),
                              )
                            : RaisedButton(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                color: _secondaryTextColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.book,
                                      color: _secondaryColor,
                                    ),
                                    Text(
                                      'Select a Book',
                                      style: TextStyle(color: _secondaryColor),
                                    ),
                                    IconButton(
                                        icon: _bookExp
                                            ? Icon(
                                                Icons.keyboard_arrow_up,
                                                color: _secondaryColor,
                                              )
                                            : Icon(
                                                Icons.keyboard_arrow_down,
                                                color: _secondaryColor,
                                              ),
                                        onPressed: null),
                                  ],
                                ),
                                onPressed: () {
                                  pickBook();
                                }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _bookExp
                                ? Column(
                                    children: <Widget>[
                                      IconButton(
                                          color: _primaryColor,
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            removeBook();
                                          }),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          _book.split('/').last,
                                          style: TextStyle(
                                              color: _secondaryTextColor),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  )
                                : Container()
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    OutlineButton(
                      splashColor: Colors.green[300],
                      borderSide: BorderSide(color: _secondaryTextColor),
                      textColor: Colors.green[700],
                      child: Text(widget.mode == 'blog' ? 'CREATE' : 'ADD'),
                      onPressed: () {
                        widget.mode == 'blog' ? createBlog() : createBook();
                      },
                    )
                  ],
                ),
              )),
        ));
  }

  pickImage() async {
    var image;
    if (_image == null || _image == '') {
      image = await FilePicker.getFilePath(type: FileType.IMAGE);
      if (image != null) {
        setState(() {
          _image = image;
          _imageExp = true;
        });
      } else {
        setState(() {
          _imageExp = false;
        });
      }
    } else {
      setState(() {
        _imageExp = !_imageExp;
      });
    }
  }

  pickBook() async {
    var book;
    if (_book == null || _book == '') {
      book = await FilePicker.getFilePath(type: FileType.ANY);
      if (book != null) {
        setState(() {
          _book = book;
          _bookExp = true;
        });
      } else {
        setState(() {
          _bookExp = false;
        });
      }
    } else {
      setState(() {
        _bookExp = !_bookExp;
      });
    }
  }

  removeImage() {
    setState(() {
      _image = '';
      _imageExp = false;
    });
  }

  removeBook() {
    setState(() {
      _book = '';
      _bookExp = false;
    });
  }

  createBlog() {
    setState(() {
      _post['title'] = _titleController.text.trim();
      _post['author'] = _authorController.text.trim();
      _post['body'] = _bodyController.text.trim();
      _post['image'] = File(_image);
      _post['created'] = DateTime.now().toString().split('.')[0];
      _post['edited'] = DateTime.now().toString().split('.')[0];
      _post['more'] = false;
      Navigator.of(context).pop(_post);
    });
  }

  createBook() {
    setState(() {
      _newBook['title'] = _titleController.text.trim();
      _newBook['author'] = _authorController.text.trim();
      _newBook['cover'] = File(_image);
      _newBook['book'] = File(_book);
      _newBook['added'] = DateTime.now().toString().split('.')[0];
    });
    Navigator.of(context).pop(_newBook);
  }
}
