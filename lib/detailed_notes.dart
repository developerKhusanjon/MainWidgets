import 'package:flutter/material.dart';
import 'notes.dart';

class DetailedNote extends StatefulWidget {
   final Note _selectedNote;

   DetailedNote(this._selectedNote);

  @override
  _DetailedNoteState createState() => _DetailedNoteState(_selectedNote);
}

class _DetailedNoteState extends State<DetailedNote> {
  Note _myNote;
  _DetailedNoteState(this._myNote);

  _handleCheckState(bool isChecked) {
    this.setState(() {
      _myNote.setTurnedOn = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        onPressed: (){
          Navigator.pop(context,_myNote.getTurnedOnState);
        },),
        elevation: 0.1,
        backgroundColor: _myNote.getPrimaryColor,
        title: Text(_myNote.getTitle,style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0,top: 8.0,bottom: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_myNote.getContentNote,style: TextStyle(color: _myNote.getTurnedOnState ? _myNote.getPrimaryColor : Colors.grey,fontWeight: FontWeight.w300),),
                Checkbox(value: _myNote.getTurnedOnState,onChanged: _handleCheckState,activeColor: _myNote.getPrimaryColor,)
              ],
            )
          ],
        ),
      ),
    );
  }
}



//class DetailedNote extends StatefulWidget {
//  final Note _selectedNote;
//
//  DetailedNote(this._selectedNote);
//
//  @override
//  _DetailedNoteState createState() => _DetailedNoteState(_selectedNote);
//}
//
//class _DetailedNoteState extends State<DetailedNote> {
//  Note _selectedNote;
//
//  _DetailedNoteState(this._selectedNote);
//
//  _handleReadCheckBox(bool readState) {
//    this.setState(() {
//      _selectedNote.setReadSate = readState;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back_ios,
//            color: Colors.white,
//          ),
//          onPressed: () {
//            Navigator.pop(context,_selectedNote.getNoteState);
//          },
//        ),
//        title: Text(_selectedNote.getTitle),
//        backgroundColor: Colors.purpleAccent,
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(8.0),
//              child: Text(
//                _selectedNote.getNoteContent,
//                style: TextStyle(fontSize: 20),
//              ),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  'Read?',
//                  style: TextStyle(fontSize: 20),
//                ),
//                Checkbox(
//                  value: _selectedNote.getNoteState,
//                  onChanged: _handleReadCheckBox,
//                )
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
