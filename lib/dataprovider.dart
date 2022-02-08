import 'package:flutter/material.dart';

class Datap extends ChangeNotifier{
  int _part = 0;
  int get count => _part;
  int _skip = 0;
  int get skip => _skip;


  void setPart(int part) {
    _part = part;
  }
  void setSkip(int skip) {
    _skip = skip;
  }
}