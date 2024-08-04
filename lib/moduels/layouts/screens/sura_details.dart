import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/moduels/layouts/screens/quran_screen.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "suraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  bool isDark = AppTheme.isDark;
  Color darkPrimary = AppTheme.darkPrimary;
  Color darkSecondary = AppTheme.darkSecondary;

  @override
  Widget build(BuildContext context) {
    data model = ModalRoute.of(context)?.settings.arguments as data;
    int count = verses.length;

    if (verses.isEmpty) {
      readSura(model.index + 1);
    }
    return bg_widget(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(
                Icons.arrow_back,
              )),
          title: Column(
            children: [
              Text(
                "سوره ${model.sura}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("بسم الله الرحمن الرحيم",
                style: GoogleFonts.elMessiri(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: isDark ? darkPrimary : Color(0xffB7935F),
                    boxShadow: [
                      BoxShadow(
                          color: isDark ? Color(0xffB7935F) : Colors.white,
                          blurRadius: 1,
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child: RichText(
                    textAlign:
                        count <= 20 ? TextAlign.center : TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      children: [
                        for (var i = 0; i <= count - 1; i++) ...{
                          TextSpan(
                              text: verses[i],
                              style: isDark
                                  ? Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context).textTheme.bodyMedium),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: CircleAvatar(
                              backgroundColor:
                                  isDark ? Color(0xffB7935F) : Colors.white,
                              child: Text(
                                '${i + 1}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                textScaleFactor:
                                    i.toString().length <= 2 ? 1 : .8,
                              ),
                              radius: 14,
                            ),
                          ),
                        },
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  readSura(int index) async {
    String sura =
        await rootBundle.loadString("assets/suras/${index}.txt"); // all

    String newSura = sura.trim();
    List<String> suraLine = newSura.split("\n"); // line
    verses = suraLine;
    setState(() {});
  }
}
