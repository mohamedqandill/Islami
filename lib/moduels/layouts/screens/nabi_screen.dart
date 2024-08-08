import 'package:flutter/material.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_theme.dart';

class NabiScreen extends StatefulWidget {
  static const String routeName = "nabiScreen";

  NabiScreen({super.key});

  @override
  State<NabiScreen> createState() => _NabiScreenState();
}

int counter = 0;

class _NabiScreenState extends State<NabiScreen> {
  bool isDark = AppTheme.isDark;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
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
        ),
        body: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "الصلاه علي النبي ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                Text(
                  "$counter",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 20,
                        side: pro.mode == ThemeMode.dark
                            ? BorderSide(color: Colors.red, width: 2)
                            : BorderSide(color: Colors.white, width: 2),
                        backgroundColor: pro.mode == ThemeMode.dark
                            ? Color(0xffFACC1D).withOpacity(0.7)
                            : Color(0xffB7935F),
                        shape: CircleBorder(side: BorderSide()),
                        fixedSize: Size(300, 250)),
                    onPressed: () {
                      counter++;

                      setState(() {});
                    },
                    child: Text(
                      "صلي علي النبي",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
