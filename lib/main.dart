import 'package:beginner_course/message_screen.dart';
import 'package:beginner_course/notes.dart';
import 'package:flutter/material.dart';
import 'package:beginner_course/detailed_notes.dart';

void main() => runApp(MaterialApp(
  title: 'Notes',
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes;

  _HomeScreenState() {
    _notes = Notes.initializeNotes().getNotes;
  }

  _handleDetailedViewData(int index) async{
    bool data = await Navigator.push(context, MaterialPageRoute(builder:(context) => DetailedNote(_notes[index]))) ?? _notes[index].getTurnedOnState;
    this.setState(() {
      _notes[index].setTurnedOn = data;
    });
  }

  _handleListItem(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(_notes[index].getTitle,style: TextStyle(color: _notes[index].getTurnedOnState ? Colors.cyan.shade700 : Colors.grey),),
        Icon(_notes[index].getTurnedOnState ? Icons.check_circle : Icons.remove_circle,color: _notes[index].getTurnedOnState ? Colors.green.shade700 : Colors.grey,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    Future<bool> _onBackPressed() {
      return showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App?'),
          actionsPadding: EdgeInsets.all(0.0),
          actions: <Widget>[
            MaterialButton(
              splashColor: Colors.grey.shade300,
              elevation: 0.0,
              child: Text('No'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            MaterialButton(
              splashColor: Colors.grey.shade300,
              elevation: 0.0,
              child: Text('Yes'),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        )
      ) ?? false;
    }
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ToDoList",style: TextStyle(fontSize: 20),),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_vert,color: Colors.white,),onPressed: () {},)
          ],
          backgroundColor: Colors.cyan.shade700,
          elevation: 0.1,
        ),
        body: ListView.builder(
            itemCount: _notes.length,
            itemBuilder: (context,index) {
              return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.cyan,width: 0.2))
                  ),
                  child: ListTile(title: _handleListItem(index),
                  onTap: () {
                    _handleDetailedViewData(index);
                  },
                  ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Message Box',
          child: Icon(Icons.message,size: 28,),
          backgroundColor: Colors.cyan.shade700,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen()));
          },
        ),
      ),
    );
  }
}


//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//    title: 'Notes',
//    home: HomeScreen(),
//  ));
//}
//
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeScreenState createState() => _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen> {
//  List<Note> _notes;
//
//  _HomeScreenState() {
//    _notes = Notes.initializeNotes().getNotes;
//  }
//
//  _handleDetailedViewData(int index) async{
//    bool data = await Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedNote(_notes[index])));
//    this.setState(() {
//      _notes[index].setReadSate = data;
//    });
//  }
//
//  _handleIconDisplay(int index) {
//    bool readState = _notes[index].getNoteState;
//    return Icon(readState? Icons.check_circle : Icons.remove_circle, color: readState? Colors.green : Colors.red,);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Notes',
//          style: TextStyle(color: Colors.white),
//        ),
//        backgroundColor: Colors.purple,
//      ),
//      body: ListView.builder(
//          itemCount: _notes.length,
//          itemBuilder: (context, index) {
//            return Container(
//              decoration: BoxDecoration(
//                  border:
//                      Border(top: BorderSide(color: Colors.grey, width: 1.0))),
//              child: ListTile(
//                title: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text(_notes[index].getTitle),
//                    _handleIconDisplay(index)
//                  ],
//                ),
//                onTap: () {
//                    _handleDetailedViewData(index);
//                },
//              ),
//            );
//          }),
//    );
//  }
//}
