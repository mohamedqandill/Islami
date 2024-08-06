import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/moduels/layouts/screens/language_bottom_sheet.dart';
import 'package:islami/moduels/layouts/screens/theme_bottom_sheet.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 2),
              child: Text("themeTap".tr())),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return ThemeBottomSheet();
                  });
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xffFACC1D), width: 2),
              ),
              child: Text(
                  pro.mode == ThemeMode.light ? "light".tr() : "darkTap".tr()),
              padding: EdgeInsets.all(18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 2),
              child: Text("languageTap".tr())),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return LanguageBottomSheet();
                  });
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xffFACC1D), width: 2),
              ),
              child: context.locale == Locale("en")
                  ? Text("englishTap".tr())
                  : Text("arabicTap".tr()),
              padding: EdgeInsets.all(18),
            ),
          )
        ],
      ),
    );
  }
}
