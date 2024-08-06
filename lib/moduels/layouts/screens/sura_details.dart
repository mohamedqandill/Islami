import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/moduels/layouts/screens/quran_screen.dart';
import 'package:islami/providers/sura_details_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_provider.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "suraDetails";

  SuraDetails({super.key});

  bool isDark = AppTheme.isDark;
  Color darkPrimary = AppTheme.darkPrimary;
  Color darkSecondary = AppTheme.darkSecondary;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    // var provider = Provider.of<SuraDetailsProvider>(context);

    var model = ModalRoute.of(context)?.settings.arguments as data;

    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..readSura(model.index + 1),
        builder: (context, child) {
          var provider = Provider.of<SuraDetailsProvider>(context);
          return bg_widget(
            child: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                title: Column(
                  children: [
                    Text(
                      "سوره ${model.sura}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(children: [
                Text("بسم الله الرحمن الرحيم",
                    style: GoogleFonts.elMessiri(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: pro.mode == ThemeMode.dark
                            ? darkPrimary
                            : Color(0xffB7935F),
                        boxShadow: [
                          BoxShadow(
                              color: pro.mode == ThemeMode.dark
                                  ? Colors.redAccent
                                  : Colors.white,
                              blurRadius: 3,
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: SingleChildScrollView(
                      child: RichText(
                        textAlign: provider.verses.length <= 20
                            ? TextAlign.center
                            : TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          children: [
                            for (var i = 0;
                                i <= provider.verses.length - 1;
                                i++) ...{
                              TextSpan(
                                  text: provider.verses[i],
                                  style: pro.mode == ThemeMode.dark
                                      ? Theme.of(context).textTheme.bodyLarge
                                      : Theme.of(context).textTheme.bodyMedium),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: CircleAvatar(
                                  backgroundColor: pro.mode == ThemeMode.dark
                                      ? Colors.red.withOpacity(0.5)
                                      : Colors.white,
                                  child: Text(
                                    '${i + 1}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: pro.mode == ThemeMode.dark
                                            ? Colors.white
                                            : Colors.black,
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
              ]),
            ),
          );
        });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}