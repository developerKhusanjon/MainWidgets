import 'dart:ui';
import 'package:beginner_course/main.dart';
import 'package:beginner_course/message_screen.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<InfoScreen> {
  bool _showBottomBar = false;
  double threshold = 20;

  String _name;

  Future<String> _customAlertDialog(BuildContext context) {
    TextEditingController _myController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Your Name?'),
              content: TextField(
                controller: _myController,
                decoration: InputDecoration(hintText: 'Husanboy'),
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  splashColor: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text('Submit'),
                  onPressed: () {
                    String textValue = _myController.text.toString() == ''
                        ? 'Husanboy'
                        : _myController.text.toString();
                    return Navigator.of(context).pop(textValue);
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Short info',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > threshold) {
            setState(() {
              _showBottomBar = false;
            });
          } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
            setState(() {
              _showBottomBar = true;
            });
          }
        },
        child: Builder(
          builder: (context) {
            return Container(
              height: heigth,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      splashColor: Colors.grey.shade600,
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: () {
                        _customAlertDialog(context).then((value) {
                          this.setState(() {
                            _name = value;
                          });
                          SnackBar mySnackBar = SnackBar(
                            content: Text('Hello $value'),
                            duration: Duration(seconds: 1),
                          );
                          Scaffold.of(context).showSnackBar(mySnackBar);
                        });
                      },
                      child: Text("Alert Dialog"),
                    ),
                  ),
                 _showBottomBar ? AnimatedOpacity(
                    curve: Curves.bounceIn,
                    duration: Duration(milliseconds: 200),
                    opacity: _showBottomBar ? 1.0 : 0.0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ):Center(),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    bottom: _showBottomBar ? -20 : -(heigth / 4),
                    child: BottomMenu(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        color: Colors.black,
        width: width,
        height: height / 4 + 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('TODO List',style: TextStyle(color: Colors.white),),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MessageScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Message Page',style: TextStyle(color: Colors.white),),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
