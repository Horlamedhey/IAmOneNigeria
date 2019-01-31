import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iamonenigeria/pages/form.dart';
import 'package:iamonenigeria/pages/home.dart';

void main() async {
  Widget _defaultHome = HomePage();
  if (await FlutterSecureStorage().read(key: 'role') == null) {
    _defaultHome = LoginPage();
  }
  runApp(new MyApp(
    defaultHome: _defaultHome,
  ));
}

class MyApp extends StatelessWidget {
  final Widget defaultHome;
  const MyApp({Key key, this.defaultHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IAmOneNigeria',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: defaultHome,
      routes: {
        '/home': (context) => LoginPage(),
        'myHomePage': (context) => HomePage()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);
  FocusNode focusNode = new FocusNode();
  bool login = true;
  bool logging = false;
  String _logText = "Don't have an account yet? ";
  String _regText = "Already have an account? ";
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 30.0,
        color: Colors.black,
        child: Center(
            child: FlatButton(
                onPressed: () {
                  logging
                      ? ''
                      : setState(() {
                          login = !login;
                        });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      login ? _logText : _regText,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      login ? 'Register' : 'Login',
                      style: TextStyle(color: Colors.lime),
                    ),
                  ],
                ))),
      ),
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/popbg.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(focusNode),
          child: SingleChildScrollView(
              child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Theme(
              data: new ThemeData(
                  brightness: Brightness.dark,
                  inputDecorationTheme: new InputDecorationTheme(
                    // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                    labelStyle:
                        new TextStyle(color: Colors.lime, fontSize: 25.0),
                  )),
              isMaterialAppTheme: true,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/poplogo.png',
                    scale: 9,
                  ),
                  new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Form(
                      key: _formKey,
                      autovalidate: true,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: login
                                  ? Column(
                                      children: <Widget>[
                                        Theme(
                                            data: ThemeData(
                                                cursorColor:
                                                    _secondaryTextColor,
                                                hintColor: _secondaryTextColor,
                                                textSelectionColor:
                                                    _secondaryTextColor,
                                                inputDecorationTheme:
                                                    InputDecorationTheme(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .lime)))),
                                            child: TextFormField(
//              controller: _authorController,
                                              style: TextStyle(
                                                  color: _secondaryTextColor),
                                              decoration: new InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(15.0),
                                                labelStyle: TextStyle(
                                                    color: Colors.lime),
                                                border: OutlineInputBorder(),
                                                labelText: "Email",
                                              ),
                                              keyboardType: TextInputType.text,
                                            )),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Theme(
                                            data: ThemeData(
                                                cursorColor:
                                                    _secondaryTextColor,
                                                hintColor: _secondaryTextColor,
                                                textSelectionColor:
                                                    _secondaryTextColor,
                                                inputDecorationTheme:
                                                    InputDecorationTheme(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .lime)))),
                                            child: TextFormField(
//              controller: _authorController,
                                              style: TextStyle(
                                                  color: _secondaryTextColor),
                                              decoration: new InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(15.0),
                                                labelStyle: TextStyle(
                                                    color: Colors.lime),
                                                border: OutlineInputBorder(),
                                                labelText: "Password",
                                              ),
                                              keyboardType: TextInputType.text,
                                            )),
                                      ],
                                    )
                                  : MyForm(
                                      color: Colors.lime,
                                    )),
                          new Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                          ),
                          OutlineButton(
                            splashColor: Colors.green[300],
                            borderSide: BorderSide(color: Colors.lime),
                            textColor: Colors.lime,
                            child: login ? Text('LOGIN') : Text('REGISTER'),
                            onPressed: () {
                              FocusScope.of(context).requestFocus(focusNode);
                              login
                                  ? setState(() {
                                      logging = true;
                                    })
                                  : print('registering...');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
        logging
            ? Container(
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: true,
                        color: Color(0xff00a2ff),
                      ),
                    ),
                    Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: Color(0xff00a2ff),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.1),
                                  child: Text(
                                    'Login as?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                    ),
                                  )),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.18)),
                            SingleChildScrollView(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15.0),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      gotoHome('Central Admin');
                                    },
                                    child: Text('Central Admin'),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      gotoHome('State Admin');
                                    },
                                    child: Text('State Admin'),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      gotoHome('National Executive');
                                    },
                                    child: Text('National Executive'),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      gotoHome('Member');
                                    },
                                    child: Text('Member'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: RaisedButton(
                                  child: Text('close'),
                                  onPressed: () {
                                    setState(() {
                                      logging = false;
                                    });
                                  },
                                )),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )
            : Container(),
      ]),
    );
  }

  gotoHome(role) async {
    await storage.write(key: 'role', value: role);
    Navigator.of(context).pushReplacementNamed('myHomePage');
  }
}
