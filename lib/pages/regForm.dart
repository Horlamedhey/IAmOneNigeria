import 'package:flutter/material.dart';
import 'package:iamonenigeria/pages/form.dart';

class RegForm extends StatefulWidget {
  RegForm({Key key, this.role});
  final String role;
  @override
  _RegFormState createState() => new _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);
  FocusNode focusNode = new FocusNode();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              child: Center(
                child: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    Text(
                      'New ${widget.role}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: _secondaryTextColor),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    MyForm(mode: 'profile', color: _secondaryTextColor),
                  ],
                )),
              ),
            )));
  }
}
