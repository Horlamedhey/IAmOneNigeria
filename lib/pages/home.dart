import 'package:flutter/material.dart';
import 'package:iamonenigeria/pages/liblog.dart';
import 'package:iamonenigeria/pages/profile.dart';
import 'package:iamonenigeria/pages/registration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _primaryColor = Color.fromRGBO(0, 153, 51, 1);
  final Color _secondaryColor = Color.fromRGBO(17, 34, 51, 1);
  @override
  void initState() {
    super.initState();
  }

  String activeTabLabel = 'Profile';
  Widget activeTab = Profile();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          color: _primaryColor,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(17, 34, 51, 1),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
        SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: _primaryColor),
                  title: Text(
                    activeTabLabel,
                    style: TextStyle(color: _primaryColor),
                  ),
                  actions: <Widget>[
                    PopupMenuButton(
                      key: null,
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry>[
                          activeTab == Profile()
                              ? PopupMenuItem(child: Text('Change Password'))
                              : PopupMenuItem(),
                          PopupMenuItem(child: Text('View Posts')),
                        ];
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  ],
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                ),
                drawer: Drawer(
                    child: Container(
                  color: _secondaryColor,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 120.0,
                        child: DrawerHeader(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/poplogo.png'),
                                width: 50.0,
                              ),
                              Text(
                                'AbdulGafar Olamide Ajao',
                                style: TextStyle(
                                    color: _primaryColor, fontSize: 18.0),
                              )
                            ],
                          ),
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
                      ListTile(
                        leading: Icon(Icons.person, color: _primaryColor),
                        title: Text(
                          'Profile',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {
                          setState(() {
                            activeTabLabel = 'Profile';
                            activeTab = Profile();
                            Navigator.pop(context);
                          });
                        },
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.person_add, color: _primaryColor),
                        title: Text(
                          'Registration',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {
                          setState(() {
                            activeTabLabel = 'Registration';
                            activeTab = Registration();
                            Navigator.pop(context);
                          });
                        },
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.announcement, color: _primaryColor),
                        title: Text(
                          'Manage Blog',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {
                          setState(() {
                            activeTabLabel = 'Blog';
                            activeTab = LibBlog(
                              mode: 'Blog',
                            );
                            Navigator.pop(context);
                          });
                        },
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.library_books, color: _primaryColor),
                        title: Text(
                          'Manage Library',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {
                          setState(() {
                            activeTabLabel = 'Library';
                            activeTab = LibBlog(
                              mode: 'Library',
                            );
                            Navigator.pop(context);
                          });
                        },
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.font_download, color: _primaryColor),
                        title: Text(
                          'Job Ads',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.event_note, color: _primaryColor),
                        title: Text(
                          'Manage Events',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.poll, color: _primaryColor),
                        title: Text(
                          'Create Poll',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.mail, color: _primaryColor),
                        title: Text(
                          'Manage Mails',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: _primaryColor,
                        height: 2.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app, color: _primaryColor),
                        title: Text(
                          'Logout',
                          style: TextStyle(color: _primaryColor),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                      ),
                    ],
                  ),
                )),
                backgroundColor: Colors.transparent,
                body: activeTab))
      ],
    ));
  }
}
