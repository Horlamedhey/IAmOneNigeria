import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  final Color _secondaryTextColor = Color.fromRGBO(200, 200, 200, 0.5);
  final storage = FlutterSecureStorage();
  static String _role = '';
  @override
  void initState() {
    super.initState();
    getRole();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8,
            child: Card(
                color: _secondaryColor,
                elevation: 25.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 120.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text('Name: ',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 18.0)),
                          Text(
                            'Jane Maxwell',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: _secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Email: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'admin@iamanigerian.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: _secondaryTextColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Role: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            _role,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: _secondaryTextColor),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 90.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _primaryColor,
              ),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width <
                        MediaQuery.of(context).size.height
                    ? MediaQuery.of(context).size.width / 6
                    : MediaQuery.of(context).size.height / 6,
                backgroundImage: AssetImage(
                  'assets/poplogo.png',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  getRole() async {
    String role = await storage.read(key: 'role');
    setState(() {
      _role = role;
    });
  }
}
