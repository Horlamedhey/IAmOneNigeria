import 'package:flutter/material.dart';
import 'package:iamonenigeria/pages/regForm.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegistrationState();
  }
}

class _RegistrationState extends State<Registration> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);
  FocusNode focusNode = new FocusNode();
  final roles = ['State Admin', 'National Executive', 'Member'];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: roles
                        .map((String role) => Container(
                              margin: EdgeInsets.only(top: 25.0),
                              width: 300.0,
                              height: 150.0,
                              child: Card(
                                color: _secondaryColor,
                                elevation: 10.0,
                                child: InkWell(
                                  splashColor:
                                      Color.fromRGBO(200, 200, 200, 0.5),
                                  onTap: () {
                                    Future.delayed(Duration(milliseconds: 120),
                                        () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              RegForm(role: role));
                                    });
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person_add,
                                        size: 70.0,
                                        color: _primaryColor,
                                      ),
                                      SizedBox(
                                        height: 25.0,
                                      ),
                                      Text(
                                        role,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Color.fromRGBO(
                                                200, 200, 200, 0.5)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList()),
              )),
        ),
      ],
    );
  }
}
