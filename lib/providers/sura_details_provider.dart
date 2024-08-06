import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  readSura(int index) async {
    String sura =
        await rootBundle.loadString("assets/suras/${index}.txt"); // all

    String newSura = sura.trim();
    List<String> suraLine = newSura.split("\n"); // line
    verses = suraLine;
    notifyListeners();
  }
}
