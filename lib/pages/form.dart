import 'package:flutter/material.dart';
import 'package:iamonenigeria/states.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key key, this.mode, this.color}) : super(key: key);
  final String mode;
  final Color color;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFormState();
  }
}

class _MyFormState extends State<MyForm> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);
  FocusNode focusNode = new FocusNode();
  @override
  void initState() {
    super.initState();
  }

  String selectedState = 'Abia';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Theme(
            data: ThemeData(
                cursorColor: widget.mode == 'profile'
                    ? _primaryColor
                    : _secondaryTextColor,
                hintColor: _secondaryTextColor,
                textSelectionColor: _secondaryTextColor,
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.mode == 'profile'
                                ? _primaryColor
                                : widget.color)))),
            child: TextFormField(
//              controller: _authorController,
              style: TextStyle(
                  color: widget.mode == 'profile'
                      ? _primaryColor
                      : _secondaryTextColor),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                labelStyle: TextStyle(color: widget.color),
                border: OutlineInputBorder(),
                labelText: "Full Name",
              ),
              keyboardType: TextInputType.text,
            )),
        SizedBox(
          height: 15.0,
        ),
        Theme(
            data: ThemeData(
                cursorColor: widget.mode == 'profile'
                    ? _primaryColor
                    : _secondaryTextColor,
                hintColor: _secondaryTextColor,
                textSelectionColor: _secondaryTextColor,
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.mode == 'profile'
                                ? _primaryColor
                                : widget.color)))),
            child: TextFormField(
//              controller: _authorController,
              style: TextStyle(
                  color: widget.mode == 'profile'
                      ? _primaryColor
                      : _secondaryTextColor),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                labelStyle: TextStyle(color: widget.color),
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
            )),
        SizedBox(
          height: 15.0,
        ),
        Theme(
            data: ThemeData(
                cursorColor: widget.mode == 'profile'
                    ? _primaryColor
                    : _secondaryTextColor,
                hintColor: _secondaryTextColor,
                textSelectionColor: _secondaryTextColor,
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.mode == 'profile'
                                ? _primaryColor
                                : widget.color)))),
            child: TextFormField(
//              controller: _authorController,
              style: TextStyle(
                  color: widget.mode == 'profile'
                      ? _primaryColor
                      : _secondaryTextColor),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                labelStyle: TextStyle(color: widget.color),
                border: OutlineInputBorder(),
                labelText: "Phone Number",
              ),
              keyboardType: TextInputType.phone,
            )),
        SizedBox(
          height: 15.0,
        ),
        Theme(
          data: ThemeData(
              cursorColor: widget.mode == 'profile'
                  ? _primaryColor
                  : _secondaryTextColor,
              hintColor: _secondaryTextColor,
              textSelectionColor: _secondaryTextColor,
              inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.mode == 'profile'
                              ? _primaryColor
                              : widget.color)))),
          child: FormField(builder: (FormFieldState state) {
            return InputDecorator(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                  labelStyle: TextStyle(color: widget.color),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.color))),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                items: states.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value + ' State',
                        style: TextStyle(color: Colors.grey),
                      ));
                }).toList(),
                onChanged: (String newState) {
                  setState(() {
                    selectedState = newState;
                  });
                },
                style: TextStyle(
                    color: widget.mode == 'profile'
                        ? _primaryColor
                        : _secondaryTextColor),
                value: selectedState,
              )),
            );
          }),
        ),
        SizedBox(
          height: 15.0,
        ),
        Theme(
            data: ThemeData(
                cursorColor: widget.mode == 'profile'
                    ? _primaryColor
                    : _secondaryTextColor,
                hintColor: _secondaryTextColor,
                textSelectionColor: _secondaryTextColor,
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.mode == 'profile'
                                ? _primaryColor
                                : widget.color)))),
            child: TextFormField(
//              controller: _authorController,
              style: TextStyle(
                  color: widget.mode == 'profile'
                      ? _primaryColor
                      : _secondaryTextColor),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                labelStyle: TextStyle(color: widget.color),
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            )),
        SizedBox(
          height: 15.0,
        ),
        widget.mode != 'profile'
            ? Theme(
                data: ThemeData(
                    cursorColor: widget.mode == 'profile'
                        ? _primaryColor
                        : _secondaryTextColor,
                    hintColor: _secondaryTextColor,
                    textSelectionColor: _secondaryTextColor,
                    inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.mode == 'profile'
                                    ? _primaryColor
                                    : widget.color)))),
                child: TextFormField(
//              controller: _authorController,
                  style: TextStyle(
                      color: widget.mode == 'profile'
                          ? _primaryColor
                          : _secondaryTextColor),
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    labelStyle: TextStyle(color: widget.color),
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ))
            : Container(),
        widget.mode != 'profile'
            ? SizedBox(
                height: 15.0,
              )
            : Container(),
        widget.mode == 'profile'
            ? OutlineButton(
                splashColor: Colors.green[300],
                borderSide: BorderSide(color: _primaryColor),
                textColor: _primaryColor,
                child: Text('REGISTER'),
                onPressed: () {
                  print('registering...');
                },
              )
            : Container(),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
