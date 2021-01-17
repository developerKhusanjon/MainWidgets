import 'package:flutter/material.dart';

class Notes {
  List<Note> _notes;
  Notes.init(){
    _notes = List<Note>();
    _notes.add(Note("Waking", "Wake me Up on time early", true, Colors.deepPurple));
    _notes.add(Note("Running", "Alert me about daily Running", true, Colors.grey.shade700));
    _notes.add(Note("Nutrition", "Alert me about daily Healthy Eating", false, Colors.redAccent));
    _notes.add(Note("Drinking", "Alert me about daily Drink Water", true, Colors.green));
    _notes.add(Note("Reading", "Alert me about daily Reading a Book", true, Colors.pink));
    _notes.add(Note("Learning", "Alert me about daily Course Tasks", false, Colors.teal));
    _notes.add(Note("Coding", "Alert me about daily Practice on Coding", false, Colors.blueGrey));
    _notes.add(Note("Asleep", "It's time to Sleep", false, Colors.black));
  }
  Notes.initializeNotes() {
    _notes = List<Note>();
    _notes.add(Note("Waking", "Wake me Up on time early", true, Colors.deepPurple));
    _notes.add(Note("Running", "Alert me about daily Running", true, Colors.grey.shade700));
    _notes.add(Note("Nutrition", "Alert me about daily Healthy Eating", false, Colors.redAccent));
    _notes.add(Note("Drinking", "Alert me about daily Drink Water", true, Colors.green));
    _notes.add(Note("Reading", "Alert me about daily Reading a Book", true, Colors.pink));
    _notes.add(Note("Learning", "Alert me about daily Course Tasks", false, Colors.teal));
    _notes.add(Note("Coding", "Alert me about daily Practice on Coding", false, Colors.blueGrey));
    _notes.add(Note("Asleep", "It's time to Sleep", false, Colors.black));
  }

  List<Note> get getNotes => _notes;
}

class Note {
  String _title;
  String _contentNote;
  bool _aliveNote;
  Color _primaryColor;

  Note(this._title,this._contentNote,this._aliveNote,this._primaryColor);

  String get getTitle => _title;
  String get getContentNote => _contentNote;
  bool get getTurnedOnState => _aliveNote;
  Color get getPrimaryColor => _primaryColor;
  set setTurnedOn(bool isTurnedOn) => this._aliveNote = isTurnedOn;
}