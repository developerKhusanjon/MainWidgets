import 'dart:math';
import 'package:beginner_course/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  _getCustomListTile(context, icon, title) {
    return InkWell(
      onTap: () {
        this.setState(() {
          _appTitle = title;
        });
        Navigator.pop(context);
      },
      splashColor: Colors.tealAccent.shade100,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.teal,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: DefaultTabController(
        length: 5,
        initialIndex: 1,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                DrawerHeader(
                  padding: EdgeInsetsDirectional.only(
                      start: 16.0, top: 14.0, bottom: 0, end: 5.0),
                  decoration: BoxDecoration(color: Colors.teal),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey, width: 2.0)),
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Husanjon To'ychiboyev",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "+998 999053244",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.teal.shade700,
                            onTap: () {},
                            child: Transform.rotate(
                              angle: pi / 4,
                              child: Icon(
                                Icons.brightness_2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            splashColor: Colors.teal.shade700,
                            onTap: () {
                              this.setState(() {
                                _appTitle = 'Saved Messages';
                              });
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.teal.shade700,
                                child: Icon(
                                  Icons.turned_in_not,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.white)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.2))),
                  child:
                  _getCustomListTile(context, Icon(Icons.add), 'Add Account'),
                ),
                _getCustomListTile(context, Icon(Icons.group), 'Contacts'),
                _getCustomListTile(context, Icon(Icons.folder_open), 'Folders'),
                _getCustomListTile(
                    context, Icon(Icons.location_on), 'People Nearby'),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.2))),
                  child: _getCustomListTile(
                      context, Icon(Icons.turned_in_not), 'Saved Messages'),
                ),
                _getCustomListTile(context, Icon(Icons.call), 'Calls'),
                _getCustomListTile(context, Icon(Icons.settings), 'Settings'),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              _appTitle,
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            backgroundColor: Colors.teal,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.folder_open),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.remove_red_eye),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              onTap: (index) {
                setState(() {
                  _appTitle = titles[index];
                });
              },
              tabs: icons
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SavedMessages(),
              Contacts(),
              Groups(),
              SuperGroups(),
              Channels()
            ],
          ),
        ),
      ),
      floatingActionButton: Tooltip(
        message: "TimeTable",
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.event_note,
            size: 28,
          ),
          onPressed: () async {
            String value = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoScreen())) ??
                'Null';
            this.setState(() {
              info = value;
            });
          },
        ),
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Your name is $info'),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          color: Colors.orange,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('edit'.capitalizeFirst()),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('delete'.capitalizeFirst()),
                          onTap: () {},
                        )
                      ],
                    );
                  });
            },
            icon: Icon(
              Icons.format_list_bulleted,
              color: Colors.white,
            ),
            label: Text(
              "Menu",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

List<Icon> icons = [Icon(Icons.save),Icon(Icons.person),Icon(Icons.group),Icon(Icons.group_add),Icon(Icons.speaker)];
String _appTitle = 'Contacts';
String info = 'Empty';
List<String> titles = [
  "Saved Messages",
  "Contacts",
  "Groups",
  "SuperGroups",
  "Channels"
];

class SavedMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      '''You have not 
                                Saved Messages yet...''',
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
    ).center();
  }
}

class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(titles[2]).center();
  }
}

class SuperGroups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(titles[3]).center();
  }
}

class Channels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(titles[4]).center();
  }
}

extension CustomString on String {
  String capitalizeFirst() {
    return '${this[0].toLowerCase()}${this.substring(1)}';
  }
}

extension CustomWidget on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget scale(double sc) {
    return Transform.scale(
      scale: sc,
      child: this,
    );
  }
}
