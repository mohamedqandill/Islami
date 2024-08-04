import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/moduels/layouts/screens/hadeth_screen.dart';
import 'package:islami/moduels/layouts/screens/home_screen.dart';
import 'package:islami/moduels/layouts/screens/quran_screen.dart';
import 'package:islami/moduels/layouts/screens/radio_screen.dart';
import 'package:islami/moduels/layouts/screens/sebha_screen.dart';
import 'package:islami/moduels/layouts/screens/setting_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../core/widgets/bg_widget.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";

  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

List<Widget> screen = [
  QuranScreen(),
  HadethScreen(),
  HomeScreen(),
  SebhaScreen(),
  SettingScreen(),
];
List<String> titels = [
  "القرأن الكريم",
  "الاحاديث",
  "اسلامي",
  "التسبيح",
  "الاعدادات",
];

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return bg_widget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            titels[selectedIndex],
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },

          currentIndex: selectedIndex,

          // curveSize: 150,
          // elevation: 10,

          // backgroundColor: Color(0xff141A2E),
          // color: Colors.black,
          // cornerRadius: 30,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                    size: 40, AssetImage("assets/icons/icon_quran.png")),
                label: "القرأن"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    size: 40, AssetImage("assets/icons/icon_hadeth.png")),
                label: "الاحاديث"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    size: 40, AssetImage("assets/icons/icons8-home-64.png")),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    size: 40, AssetImage("assets/icons/icon_sebha.png")),
                label: "التسبيح"),
            BottomNavigationBarItem(
              icon: Icon(size: 30, Icons.settings),
              label: "الاعدادات",
            ),
          ],
        ),
        body: screen[selectedIndex],
      ),
    );
  }
}
